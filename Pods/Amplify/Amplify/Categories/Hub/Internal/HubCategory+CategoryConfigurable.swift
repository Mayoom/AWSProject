//
// Copyright 2018-2019 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

extension HubCategory: CategoryConfigurable {

    /// Configures the HubCategory using the incoming CategoryConfiguration. If the incoming configuration does not
    /// specify a Hub plugin, then we will inject the AWSHubPlugin.
    func configure(using configuration: CategoryConfiguration) throws {
        guard configurationState != .configured else {
            let error = ConfigurationError.amplifyAlreadyConfigured(
                "\(categoryType.displayName) has already been configured.",
                "Remove the duplicate call to `Amplify.configure()`"
            )
            throw error
        }

        for (pluginKey, pluginConfiguration) in configuration.plugins {
            let plugin = try getPlugin(for: pluginKey)
            try plugin.configure(using: pluginConfiguration)
        }

        configurationState = .configured
    }

    func configure(using amplifyConfiguration: AmplifyConfiguration) throws {
        guard let configuration = categoryConfiguration(from: amplifyConfiguration) else {
            return
        }
        try configure(using: configuration)
    }

}
