Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6CDA3767F0
	for <lists+linux-leds@lfdr.de>; Fri,  7 May 2021 17:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbhEGP3y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 7 May 2021 11:29:54 -0400
Received: from mail-bn8nam12on2061.outbound.protection.outlook.com ([40.107.237.61]:25728
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232314AbhEGP3x (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 7 May 2021 11:29:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V60S0wgOigfVxEKO27nYfZdj6Cl5EUgYtrTwoXJuLl+6und7VxPkVNMu+XAEnagWw8M5SSf+M6ubJcwiIhjBGFenVkxjr9Jtu8cGuIdxcx4sL8pBA7e9QRBD/NJxwBONJQjlPByCJbPis10ioRmmgGRLq/cIkF/0crktWD3mHbbmbw9NUWha6Bi8zee7fcm5jSEWkmD/YwPqqQvoSPr9nMwX5ZW/RvQqlva/7tOlwlEvSEirmuvTjogBaCiMT5vi1YU700hQNhl9ZOm/P8hz5SLvTLklgyRZ6yWBuRwVrTN+bCgIHvLP5DXg1PAB+qurBqdjqQwXsm5rix0qwmbKzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N4VEwJyaI++rRJjz0F4n2xpD4q75zlFuMyE2ClkBRo=;
 b=CnviWeSg0H8IDW0c5RbbywUn0fA0oSInNBMGqJD4mUUlzq76cOMLn8+PBylAeWYeZ/aI46CWNt0nfpMiqCQfz6jseCEYxCzVSWjOboSl6LiJA7FzDyZh58jNnBhc9A4JtPddNXnNzjlM6zfwafSjfZZMZSRbs602mFRTAJfqVmbYvhIyOu65G7jDy7NkIBjZ7BtTbSaPgr+MGwMFFGDSPMPwJ/H3QSAER4DjWDjhJsjfWVdjJpQi2eZ2QrsOOcKVy85a5fzguVVFSWxpWoKa+xgzlo710Up+HvTfHP6Hj8umWQAHtgqDRRMKaEPMKg7DyYOsyX3dfxeZZ4MMmIvhfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N4VEwJyaI++rRJjz0F4n2xpD4q75zlFuMyE2ClkBRo=;
 b=rkskRESWXWc5H+wMdcJTcbwU/7k4UlV3HFhShuhXhcBGNiQe+tjq8PcDFWTif4Zhbd6vmuDcpO4kdiA/yopExn/Dsya6KXCOhyfQo8OxtvWR49oyZuZNkTB6+TxbM6hyJhmgzTcalgMJ13bfQcRqXogoctiKIkSljnFK9F0xuiun6tGW9TDEpZ6aGyUjR6l+5ZqqJbVJh3BzVA/zNA73FiDGHSJyTjXwfZsplshUQGec/+BUOMILlIx4WWxuo/FxHOx4r1JFq1UdXolbeTGq2BHj6RGBCUt2EFTZfQ0m/Y3hSRt9+MKYC9fPIxn3D+GjjggZAehV8h3ezWWPpFaGsg==
Received: from DM5PR19CA0071.namprd19.prod.outlook.com (2603:10b6:3:116::33)
 by DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Fri, 7 May
 2021 15:28:52 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:116:cafe::b5) by DM5PR19CA0071.outlook.office365.com
 (2603:10b6:3:116::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 7 May 2021 15:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 7 May 2021 15:28:51 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 15:28:50 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH led-next 1/1] leds: mlxreg: Provide conversion for hardware LED color code
Date:   Fri, 7 May 2021 18:28:34 +0300
Message-ID: <20210507152834.421981-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b24bc39-fa45-460c-2bc2-08d9116cd189
X-MS-TrafficTypeDiagnostic: DM6PR12MB4250:
X-Microsoft-Antispam-PRVS: <DM6PR12MB42503FDAFD3D746C9B129B7AAF579@DM6PR12MB4250.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3aLRZzl5CkZg81dirVtoRr7q7/7UlyGWZMZRWJdL3uWXH96hbh7lo6KhFXghI2raObCT6L8wAaSjxxYJ8sw0FSjnyo/2iEWINdt7/JStlJDnpP+CFpDttvkVGoulUcbEE70IgHZsqh/yJS00sFqwlsB4+FceHNHSHhRYkIRVHrIAvOoG4V2lyv7sx7YIzpWJ5kGJd71FimTjdPrLWLJZg1FJvxr0/RUE/nSEUqfhLE6IT1JeS/dhjaPsurt63+rv4rCoZTpa2U1avoBz4JVVeRNsgDgAKpXrMp9JMrUS8DZ1R09VvJDEcKSzGEhNJyN9zFw82teODaUcWPsml1JXuypZyIuJTVFDvmfSmSdc9cCAOTz4IfWicA/omrLAMdu3Jz6Z15tRCOn9FmJIDCckGvpXj0C4H3eQyjG739TZ53t4Li7IuAHUwN64rwQCd1zcBmLTdwu86A+1cDPQqaMQdXK4Taocl/Z1UUnFaYKAOSL7M1V9N2Q4czSxBN8wODKKJnA62DIiOQSzghAlxIbUH3eTCukIBBoUbt8SsVwO0HJtTgYHNT6bnoJbACFPQTjfz8INoBJj/TBNd1GLhxZaGnV19lUDHlmYSs18F9ytsc2zv0xk4hhdrdB1cFYCQZC7YTVtwwzjBOF9O435YE6Ssl0oB4sjIdnjJCoeIaj/QZI=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(36840700001)(46966006)(1076003)(336012)(2616005)(70206006)(356005)(107886003)(70586007)(36756003)(86362001)(36906005)(7636003)(83380400001)(426003)(478600001)(36860700001)(4326008)(82310400003)(6666004)(2906002)(26005)(82740400003)(186003)(8676002)(5660300002)(54906003)(16526019)(316002)(8936002)(47076005)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 15:28:51.8154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b24bc39-fa45-460c-2bc2-08d9116cd189
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4250
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In case register is set by hardware, convert hardware color code to
expose correct color to "sysfs".
For some LED color at initial state is set by hardware. Hardware
controls LED color until the first software write access to any LED
register - the first software access cancels hardware control.
If LED is under hardware control - detect the color in brightness_get()
function.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/leds/leds-mlxreg.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
index afc9070485da..9e665b2b9cb1 100644
--- a/drivers/leds/leds-mlxreg.c
+++ b/drivers/leds/leds-mlxreg.c
@@ -17,7 +17,9 @@
 #define MLXREG_LED_OFFSET_BLINK_3HZ	0x01 /* Offset from solid: 3Hz blink */
 #define MLXREG_LED_OFFSET_BLINK_6HZ	0x02 /* Offset from solid: 6Hz blink */
 #define MLXREG_LED_IS_OFF		0x00 /* Off */
-#define MLXREG_LED_RED_SOLID		0x05 /* Solid red */
+#define MLXREG_LED_RED_SOLID_HW		0x01 /* Solid red or orange by hardware */
+#define MLXREG_LED_RED_SOLID		0x05 /* Solid red or orange */
+#define MLXREG_LED_GREEN_SOLID_HW	0x09 /* Solid green by hardware */
 #define MLXREG_LED_GREEN_SOLID		0x0D /* Solid green */
 #define MLXREG_LED_AMBER_SOLID		0x09 /* Solid amber */
 #define MLXREG_LED_BLINK_3HZ		167 /* ~167 msec off/on - HW support */
@@ -30,6 +32,7 @@
  * @data: led configuration data;
  * @led_classdev: led class data;
  * @base_color: base led color (other colors have constant offset from base);
+ * @base_color_hw: base led color set by hardware;
  * @led_data: led data;
  * @data_parent: pointer to private device control data of parent;
  */
@@ -37,6 +40,7 @@ struct mlxreg_led_data {
 	struct mlxreg_core_data *data;
 	struct led_classdev led_cdev;
 	u8 base_color;
+	u8 base_color_hw;
 	void *data_parent;
 	char led_cdev_name[MLXREG_CORE_LABEL_MAX_SIZE];
 };
@@ -124,8 +128,17 @@ mlxreg_led_get_hw(struct mlxreg_led_data *led_data)
 	regval = regval & ~data->mask;
 	regval = (ror32(data->mask, data->bit) == 0xf0) ? ror32(regval,
 		 data->bit) : ror32(regval, data->bit + 4);
-	if (regval >= led_data->base_color &&
-	    regval <= (led_data->base_color + MLXREG_LED_OFFSET_BLINK_6HZ))
+
+	/*
+	 * For some LED color at initial state is set by hardware. Hardware controls LED color
+	 * until the first write access to any LED register. If LED is under hardware control -
+	 * convert the value to the software mask to expose correct color. The first LED set by
+	 * software cancels hardware control.
+	 */
+	if ((regval >= led_data->base_color &&
+	     regval <= (led_data->base_color + MLXREG_LED_OFFSET_BLINK_6HZ)) ||
+	    (led_data->base_color_hw && regval >= led_data->base_color_hw &&
+	     regval <= (led_data->base_color_hw + MLXREG_LED_OFFSET_BLINK_6HZ)))
 		return LED_FULL;
 
 	return LED_OFF;
@@ -217,16 +230,20 @@ static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
 
 		led_cdev = &led_data->led_cdev;
 		led_data->data_parent = priv;
-		if (strstr(data->label, "red") ||
-		    strstr(data->label, "orange")) {
+		if (strstr(data->label, "red")) {
+			brightness = LED_OFF;
+			led_data->base_color = MLXREG_LED_RED_SOLID;
+		} else if (strstr(data->label, "orange")) {
 			brightness = LED_OFF;
 			led_data->base_color = MLXREG_LED_RED_SOLID;
+			led_data->base_color_hw = MLXREG_LED_RED_SOLID_HW;
 		} else if (strstr(data->label, "amber")) {
 			brightness = LED_OFF;
 			led_data->base_color = MLXREG_LED_AMBER_SOLID;
 		} else {
 			brightness = LED_OFF;
 			led_data->base_color = MLXREG_LED_GREEN_SOLID;
+			led_data->base_color_hw = MLXREG_LED_GREEN_SOLID_HW;
 		}
 
 		/*
-- 
2.11.0

