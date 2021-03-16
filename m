Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6FDA33D375
	for <lists+linux-leds@lfdr.de>; Tue, 16 Mar 2021 13:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237534AbhCPL7a (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Mar 2021 07:59:30 -0400
Received: from mail-bn7nam10on2065.outbound.protection.outlook.com ([40.107.92.65]:25792
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237527AbhCPL71 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Mar 2021 07:59:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=US4asUoSahJYEXY1Ph/GiteHJmFRPPAitUKihZ3gOgS91Og5N1Dx5K41OHZu5ws63blhdpIq9EuLdujITGDtcjv7l8DXn8oWuUZNvc9F/B22kaHSaqnISM5hsrw1KmsCEQDWKkCztCoH8tGnbBaoJSMkNFZKa8r/si/YFZH0C21k24XX3PquEElqCDqxC5oVTXEBbbbxtLtnG+Zd/JIYD7ZsURyhlqGn/DhGmrjRAWIrQGHUpfT/qMha0r8Rib8t9BNApyh6jlTuBD/7ZEnQhJk1eNKFcTI51nHdCcc3fGoGHM6eIp0BN1ugYT0/vCKTPcITiee2s2AOnberJYqUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBgLEsSN7cYI7jwCwUOKZkvOZcIMQYf+ilxA5pkYi3w=;
 b=AOeRWB65UOYPEjAf8wpWzxrZFJ/RtXeJ+542bpDbqbIs/gO0FMm+pjngwD1sdY8l9RIUjvI4mnjAa2HVlULAZvEFCxAJoarBYGefJWRhGktQswiKlDbwsB1lYsSdPCe0Ahtw6W7koQWiUw6mPb64uJHmc0wMk/oXoRxlLZfqsqfkNuFT1TianhgTQSIav2RlUWDzE4QI+q/EHYFKeQp8k/ikYbWEcwslc4/JYqexz6fHYWaM3YMIBVCNgsZ11YAYJfZP/fZy3v8x6WoURSnNguaLzlqDUvC8mHCswSYATUu4AuwKK+5QNboXD7bbuT8XrHuOYPUlKULzNP+Pw2256Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBgLEsSN7cYI7jwCwUOKZkvOZcIMQYf+ilxA5pkYi3w=;
 b=hEBLiHJ0w1nBGVUTZB5goiIsn4w3iZ7tW0yylW3PDMdV9xJ+nhfXefDrdLAfEnmpskV7oKKIuMWg+qh1/FSo6lWma+0LNWE25dGJ/muzLph+0flPdNPGjEYWAkvGozBA4D60PR326Z8YXL8PdujBuWjGeWUXcg0eD0uKPFs2XbNFD+wZwy4851OSqUxW5ZFTGrnfkVj5BmX5zQQBd0YtxI5hkPW8+DejNp0hMZ3qa2shYLV+bvQpDf4tKmCzk2uJqhj8dI7qshQGiYYhvBWkWRaWgRqzFqCRWw4Z+sSDqH4ru2PpdyDfZUuUnyG7c7MOld/FI1GRaYMYor4wIFXL9Q==
Received: from BN9PR03CA0441.namprd03.prod.outlook.com (2603:10b6:408:113::26)
 by BL0PR12MB2531.namprd12.prod.outlook.com (2603:10b6:207:3f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 11:59:25 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::5d) by BN9PR03CA0441.outlook.office365.com
 (2603:10b6:408:113::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 16 Mar 2021 11:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 11:59:25 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 11:59:23 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [Re-send PATCH led-next v3 1/1] leds: mlxreg: Allow multi-instantiation of same name LED for modular systems
Date:   Tue, 16 Mar 2021 13:59:01 +0200
Message-ID: <20210316115901.1834250-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe481218-3ce1-42d1-d8d3-08d8e872f1bd
X-MS-TrafficTypeDiagnostic: BL0PR12MB2531:
X-Microsoft-Antispam-PRVS: <BL0PR12MB253136C1DFB4894B326EE637AF6B9@BL0PR12MB2531.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:117;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aMwPbKT3u2jT5BLW+WnWG4L7a6j8vimkNkL7zOba4LaWnZzZyKkYszvhNiG8Y60jgGLAj6ehl1d4zHip0XsW3fGjDv9cMuaw7IMSg/aRZhe4oHDE5s9LRlXn00X+bpYumSvPjjBlhiq5qE0z+BJEn2NHDij74N+HNRdhAa5Lhuszkz+nJCFBGBxdKpRHSn4tVRjUyX99+feDaA4sOQwbSASJUxUAEdESUKy1v3+QOUb9zrn277cfzI3aF9RMfLd6TKZq7FptBbjhmR1qjIhnHX00Kq3sve8tmV30UtGRAFOLHkK8zLQWpLMtYlwe5FsjtDybZsZhpwLxYBjjJC47lHQireTdgDVrr80WGQIjfsla+Y6wKuhzEQfZxg8x+uapkJ240tEj/jH4HVXJ3PHSMtR6Tt8lbfkrV6T7vDxm0fcGlae8oXHvAU/1lj8vn+hBcWWHSfE3/8swtZdjSbBuyZgtT6MC//Fa/rR4CnBZtgVln4fYE8X63QXjaTb5W1Abwg/VkZGJ3H+IHBOFNCwGiBelfZwG1IG4GYsU98DbSOV/KoQOOBeeZCCtZHW6SU0ajSk5IaktvnGcku8r11X/hPBkGtMGDzS0C34RevbO7hccHp4tmxqR9P1pq/8HF7l1zNaqO7Jn5ZHHn97jcKPdRwxF2oaFv8ruW/rWYAa+xOg4N34q1B/ujTGToWx+qU50
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(36840700001)(5660300002)(36756003)(2906002)(356005)(70206006)(336012)(82740400003)(6666004)(36860700001)(1076003)(86362001)(110136005)(426003)(316002)(107886003)(47076005)(7636003)(36906005)(16526019)(83380400001)(26005)(8936002)(186003)(8676002)(82310400003)(34020700004)(478600001)(70586007)(4326008)(54906003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 11:59:25.1052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe481218-3ce1-42d1-d8d3-08d8e872f1bd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2531
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

It could be more than one instance of LED with the same name in the
modular systems. For example, "status" or "uid" LED can be located
on chassis and on each line card of modular system.
In order to avoid conflicts with duplicated names, append platform
device Id, which is unique, to LED name after driver name.
Thus, for example, "status" LED on chassis is to be called, like it is
called now on non-modular systems, on which platform device Id is not
specified: "mlxreg:status:green". While for the line cards LEDs it will
be called like: "pcicard48:status:green", "ibcard66:status:green",
"nvlinkcard68:status:green", etcetera. Where line card prefix is
specified according to the type of bus connecting line card to the
chassis: PCI, InfiniBand, NVLink and so on.

LED driver works on top of register space of the programmable devices
(CPLD or FPGA), providing the logic for LED control. The programmable
devices on the line cards are connected through I2C bus and LED driver
will work over I2C. On main board programmable device is connected
through LPC, and LED driver works over LPC.

The motivation it to provide support for new modular systems which
could be equipped with the different types of replaceable line cards
and management board.

Line cards are connected to the chassis through I2C interface for the
chassis management operations and through PCIe for the networking
operations. Future line cards could be connected to the chassis through
InfiniBand fabric, instead of PCIe.

The first type of line card supports 16x100GbE QSFP28 Ethernet ports.
Those line cards equipped with the programmable devices aimed for
system control of Nvidia Ethernet switch ASIC control, Nvidia FPGA,
Nvidia gearboxes (PHYs).
The next coming  card generations are supposed to support:
- Line cards with 8x200Gbe QSFP28 Ethernet ports.
- Line cards with 4x400Gbe QSFP-DD Ethernet ports.
- Smart cards equipped with Nvidia ARM CPU for offloading and for fast
  access to the storage (EBoF).
- Fabric cards for inter-connection.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v2->v3:
 Changes added after comments from Pavel.
 - Use prefix to specify type of connectivity for particular line card.
v1->v2:
 Changes added after discussion with Pavel and Marek.
 - Change device name for line cards from "mlxreg" to "card".
 - Extend commit text - add more explanations.
---
 drivers/leds/leds-mlxreg.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
index 82aea1cd0c12..afc9070485da 100644
--- a/drivers/leds/leds-mlxreg.c
+++ b/drivers/leds/leds-mlxreg.c
@@ -228,8 +228,19 @@ static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
 			brightness = LED_OFF;
 			led_data->base_color = MLXREG_LED_GREEN_SOLID;
 		}
-		snprintf(led_data->led_cdev_name, sizeof(led_data->led_cdev_name),
-			 "mlxreg:%s", data->label);
+
+		/*
+		 * Id greater than zero is used for LEDs located on replaceable unit,
+		 * like line card or fabric card. In this case Id is set to I2C bus
+		 * number. Otherwise LEDs located on the main board. The field "identity"
+		 * specifies the type of bus connecting line card to the chassis.
+		 */
+		if (priv->pdev->id > 0)
+			sprintf(led_data->led_cdev_name, "%scard%d:%s", led_pdata->identity,
+				priv->pdev->id, data->label);
+		else
+			sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
+				data->label);
 		led_cdev->name = led_data->led_cdev_name;
 		led_cdev->brightness = brightness;
 		led_cdev->max_brightness = LED_ON;
-- 
2.11.0

