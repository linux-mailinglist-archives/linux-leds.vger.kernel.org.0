Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC29D43899C
	for <lists+linux-leds@lfdr.de>; Sun, 24 Oct 2021 17:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbhJXPES (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 24 Oct 2021 11:04:18 -0400
Received: from mail-dm6nam11on2041.outbound.protection.outlook.com ([40.107.223.41]:55777
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230379AbhJXPES (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 24 Oct 2021 11:04:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5NKi85MCj6z6XS+TB6R1pPod5vS4JhaHjdo9gn+kD+wXLRHhYgcr6KuBh4jiXUKDq8XmrfI4H3uTqoIYItZmyiDCs6uzpju1Kn94eQOlRPMEyJeopSO9CMpomtD3viS+DXbuKX/3fmDBPMapX10KlL+LyUPovDKdXVVS4hbtiA9OZEAOyUEwWQe3V/13lvJ7umdse8cQR9+EjyVfVDd4qiz/GTbz4SonMfbpD93A9QCcWbzCZ5fYeIAtxoHOcdvw95hTEAZQSDNbg1RL8NlFw/OYJELUCCVNr6JUq49ZOL68ZBJZCwiyT/TL0Oyt0+HybwsL1K55TNjCF59RY1DlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WFJjfgL3mokeFBapKbrtIsi5ZATpzWYobDs/QA41kw=;
 b=WL3o8thUoKXJl7xLBc0MvRMXprgRJVemGxWsIgG/6tNHqNbyYkEvv4UNBcIaTd8E801FjdsE6LsvUBnZyGSfQfQpa39DRREp8nI5jQTovvbJbdIEBZKpvzy+lbLWQwCjsvaLmEHExBgi4pxDh/8YVvq2kvFcEK94EOFATLZORjFs3dRZ7tD9rj5AL9GEdzBVGih6xDG3rcrqDuI2QCeipWrjA2sHuAvd+loGXTsulXewWg9xCslPe+ppCOmXxAlgqPuWgy28N0ENLmJUiBpeUM4oyBzyUUX+WkQVoa/isJw1HVjJrEzBdZ/TTgQ2yGwdlz14d4kzKNIxIui+07WDTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WFJjfgL3mokeFBapKbrtIsi5ZATpzWYobDs/QA41kw=;
 b=e0BDXv+2fIlgEDPLvRZ97cY8vTwfdPLLFip9T2rC4Dn6e+Ul2QdV2Bwwgg/0NSfFRwqHFoCVaVIeU/8fz1iB8qS6PVFJzvwLToKPmiFmww0BKicbOlqmhawqeaZq2ipMDgYEUPv3Bgc/LLk1h42yqx+BQylWwHCQw0b1IH5gByrvbpghQ1w8I/oR7msrktQv1U6V8cgb2l4NltvHuqMcpD55Win09cj7bFlowTxDW6MX5JwVy6kumna6Xxnc8CVpdAeKMHpWhUH70W+qRB+Xt6pueShiX7VZ1iVpG8v5mR8WTUtyyYrYJgk5SQMfEjoJ1RTGbaxTg6nMMGLU9fdrDg==
Received: from DM5PR07CA0133.namprd07.prod.outlook.com (2603:10b6:3:13e::23)
 by DM6PR12MB4580.namprd12.prod.outlook.com (2603:10b6:5:2a8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Sun, 24 Oct
 2021 15:01:56 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13e:cafe::4d) by DM5PR07CA0133.outlook.office365.com
 (2603:10b6:3:13e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Sun, 24 Oct 2021 15:01:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.16 via Frontend Transport; Sun, 24 Oct 2021 15:01:53 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sun, 24 Oct 2021 15:01:52 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 1/1] leds: mlxreg: Allow multi-instantiation of same name LED for modular systems
Date:   Sun, 24 Oct 2021 18:01:32 +0300
Message-ID: <20211024150132.45335-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd12142a-c5d0-413c-2874-08d996ff3759
X-MS-TrafficTypeDiagnostic: DM6PR12MB4580:
X-Microsoft-Antispam-PRVS: <DM6PR12MB45801CA3DA1BE43D3F60E905AF829@DM6PR12MB4580.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:130;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pq2qUR3VorTOpUENcsJXg3VASzmTKWY3gq/xvCGy7drpqYfMlZwIDlkPYjNsg+cvBU3UPB1xptWWpKoerJIrbNC6PaBGcupHGygocZpildKq3x6XahqUdDk+2noP3Tgg8QdKYYmWdXSw9sYJnaOTRmUt8uvn0UVusWjaul9ideujxJmxcDKcD0PrtOGM9Njk4T2aOCv+XjHlJgXF/uKsNBwJtEzuNi2MvxW6PZOtRLsJQVzvNCsKA2uyyXD9vgNlpBIkPqP8gPwYI7OXaqqZdpFCYV08KNIP5POlA0QGCOfOfxRjMpw1RbCu+5AeVV/1e9ueyWeqpnTQUFMds3OoEMZ9T8UViAbGBlM2FNtPZt/+9t3CJ0eDCg/sjOaKUfvaSX4KwGZBUW25LNZT4UzFjw25JHCDv06pzXY2vzJi6fGtgI1bseTfo27P5EM02uPPgHta3M5p9kiYIrfpTAqMNlTfEzvUKBZfdlErE376CJ2mb4FRTP41ulYrHxwqtx3MXRpMXsc2eVxZc7d0sBt0zdbyIzhnbjHukMU/OSmuxZ2e/GSRf5SQ+dn/X1eM7pF8VyJv5Y+GLl+kS36AefaB0bYIQgcpq7+1bsVbQUAwS3NtPRIvIo7uQXANYnwgTndFPFuWGAOdbORKmPVLUhlUnyV/jyFIUmtAoG44SwvNiunuZE87GrvLMkSDW/Uy301Uq9Dy1Cyit6ZjMxQSDW+D2w==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(6666004)(70586007)(16526019)(47076005)(36756003)(26005)(356005)(82310400003)(54906003)(86362001)(336012)(1076003)(316002)(2616005)(426003)(4326008)(5660300002)(2906002)(8676002)(508600001)(8936002)(107886003)(186003)(36860700001)(83380400001)(6916009)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2021 15:01:53.7913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd12142a-c5d0-413c-2874-08d996ff3759
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4580
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

It could be more than one instance of LED with the same name in the
modular systems. For example, "status" or "uid" LED can be located
on chassis and on each line card of modular system.
In order to avoid conflicts with duplicated names, device name for LED
located on line card will contain line card type and slot number, at
which card is located.
Thus, for example, "status" LED on chassis is to be called, like it is
called now on non-modular systems, on which platform device Id is not
specified: "mlxreg:status:green". While for the line cards LEDs it will
be called for example, PCI line card like:
"pcicard3:status:green", "pcicard5:status:orange", etcetera.
For line card connected through Infiniband fabric name will be like
"ibcard1:status:green", "ibcard4:status:green".

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
InfiniBand fabric, or NV-link instead of PCIe.

The first type of line card supports 16x100GbE QSFP28 Ethernet ports.
Those line cards equipped with the programmable devices aimed for
system control of Nvidia Ethernet switch ASIC control, Nvidia FPGA,
Nvidia gearboxes (PHYs).
The next coming card generations are supposed to support:
- Line cards with 8x200Gbe QSFP28 Ethernet ports.
- Line cards with 4x400Gbe QSFP-DD Ethernet ports.
- Smart cards equipped with Nvidia ARM CPU for offloading and for fast
  access to the storage (EBoF).
- Fabric cards for inter-connection.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v3->v4:
 Changes added by Vadim.
 - Change format for line card LED "devicename" to cardtype#slot_number
   (pcicard.1, pcicard2, etcetera).
v2->v3:
 Changes added after comments from Pavel.
 - Use prefix to specify type of connectivity for particular line card.
v1->v2:
 Changes added after discussion with Pavel and Marek.
 - Change device name for line cards from "mlxreg" to "card".
 - Extend commit text - add more explanations.
---
 drivers/leds/leds-mlxreg.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
index b7855c93bd72..47f0ad547496 100644
--- a/drivers/leds/leds-mlxreg.c
+++ b/drivers/leds/leds-mlxreg.c
@@ -229,8 +229,20 @@ static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
 			brightness = LED_OFF;
 			led_data->base_color = MLXREG_LED_GREEN_SOLID;
 		}
-		snprintf(led_data->led_cdev_name, sizeof(led_data->led_cdev_name),
-			 "mlxreg:%s", data->label);
+
+		/*
+		 * Id greater than zero represents LEDs located on replaceable unit,
+		 * like line card. In this case Id is set to slot number at which line
+		 * card is located. Zero Id represents LEDs located on the main board.
+		 * The field "identity" specifies by which connection type line card
+		 * is attached to the chassis, for example, PCI, InfiniBand, etcetera.
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
2.20.1

