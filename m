Return-Path: <linux-leds+bounces-4415-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ABBA7CBA2
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 21:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D73CB1892E47
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 19:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE4119ADBA;
	Sat,  5 Apr 2025 19:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="Rpb+4INM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ED61AA1D5
	for <linux-leds@vger.kernel.org>; Sat,  5 Apr 2025 19:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743880204; cv=none; b=NaJk5wVD9QW1hMPjjpcy5gC7h5mKLy/F2I+eIy/AsX8i6xVgBu2xIUwkv3NW5F2EUCoO+cgs6KpaN+7ymX+UrV6v0YF7PtW1XNBHAemjmUDsorXuNW4NAA+ab6L3Wk4O1rdKJPtpwnRpIyfEysoML5nYmoLoH0ceH8sOxMXsdKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743880204; c=relaxed/simple;
	bh=Vl8ufjeJm9EAdi+slpXjwjQcR+NfxnPbjRcq3pcVcRs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J2EfyaC81LYW1dIC3ZeLgknXUtDkfDe9hcJL4ZfeDLjrtYr4APmoP1OAu4tMzq7eEDDmSnJLZkUhqfpjQny2J2fitdK6s2dTsJSobqrYqKJzy+E4lBD8kQUpp6mgc5xWwFf7/cdrHK3cSCNf2b3lvYmsPjBeRG3TVDyBVYJn2B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=Rpb+4INM; arc=none smtp.client-ip=212.77.101.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 46982 invoked from network); 5 Apr 2025 21:09:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1743880199; bh=FolYfmHo02aZCyreVn2MKr8iJn0pLVohaMtXtghqsgg=;
          h=From:To:Cc:Subject;
          b=Rpb+4INMiK7LQFGY+iBMKnWOYU14zcy6c5XQoOEUUQgUuhpyZtAd1tzurcTlfK8k2
           JsCRygE3KRbFAmptwQCoPrEHFsBkcC1PcoOf9in+zTgYfxnDybRUgd/tB0GfzBwg/F
           YHNyM58vbd+PPBC4eALt2N19oHiDz+zuy1tJn3T9FRmpwFEIQX3XTm2mrXwzvUwyZh
           4DO3ct/bZb6OrONGZGAXgI7Uhqoijw15fAKzAHSF5I6+/VSsm0bY5MX6EhignfLuy0
           PgOSyA2Zi7z/ru04QCapcbkAvK05PblvWaf6Tn4nLEG7/qqSSObyD0GSntjT+PFqZa
           8D0aWc3ZHNAsA==
Received: from 83.5.244.88.ipv4.supernova.orange.pl (HELO laptop-olek.home) (olek2@wp.pl@[83.5.244.88])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <lxu@maxlinear.com>; 5 Apr 2025 21:09:59 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: lxu@maxlinear.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lee@kernel.org,
	linux-leds@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>,
	Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH net-next,v2 2/2] net: phy: mxl-gpy: add LED dimming support
Date: Sat,  5 Apr 2025 21:09:54 +0200
Message-Id: <20250405190954.703860-2-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250405190954.703860-1-olek2@wp.pl>
References: <20250405190954.703860-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 1ce82d4fe9c468bf0637ffa6a36f47b2
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [sTPk]                               

Some PHYs support LED dimming. The use case is a router that dims LEDs
at night. In the GPY2xx series, the PWM control register is common to
all LEDs. To avoid confusing users, only the first LED used has
brightness control enabled. In many routers only one LED is connected
to PHY. When the minimum or maximum value is set, the PWM is turned off.

As of now, only Maxlinear PHYs support dimming. In the future, support
may be extended to other PHYs such as the Realtek RTL8221B.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
Reviewed-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/phy/mxl-gpy.c | 100 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 95 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index 0c8dc16ee7bd..a89a6a57bf34 100644
--- a/drivers/net/phy/mxl-gpy.c
+++ b/drivers/net/phy/mxl-gpy.c
@@ -110,9 +110,11 @@
 #define VSPEC1_MBOX_DATA	0x5
 #define VSPEC1_MBOX_ADDRLO	0x6
 #define VSPEC1_MBOX_CMD		0x7
-#define VSPEC1_MBOX_CMD_ADDRHI	GENMASK(7, 0)
-#define VSPEC1_MBOX_CMD_RD	(0 << 8)
 #define VSPEC1_MBOX_CMD_READY	BIT(15)
+#define VSPEC1_MBOX_CMD_MASK	GENMASK(11, 8)
+#define VSPEC1_MBOX_CMD_WR	0x1
+#define VSPEC1_MBOX_CMD_RD	0x0
+#define VSPEC1_MBOX_CMD_ADDRHI	GENMASK(7, 0)
 
 /* WoL */
 #define VPSPEC2_WOL_CTL		0x0E06
@@ -124,6 +126,15 @@
 /* Internal registers, access via mbox */
 #define REG_GPIO0_OUT		0xd3ce00
 
+/* LED Brightness registers, access via mbox */
+#define LED_BRT_CTRL		0xd3cf84
+#define LED_BRT_CTRL_LVLMAX	GENMASK(15, 12)
+#define LED_BRT_CTRL_LVLMIN	GENMASK(11, 8)
+#define LED_BRT_CTRL_EN		BIT(5)
+#define LED_BRT_CTRL_TSEN	BIT(4)
+
+#define GPY_MAX_BRIGHTNESS	15
+
 struct gpy_priv {
 	/* serialize mailbox acesses */
 	struct mutex mbox_lock;
@@ -138,6 +149,9 @@ struct gpy_priv {
 	 * is enabled.
 	 */
 	u64 lb_dis_to;
+
+	/* LED index with brightness control enabled */
+	int br_led_index;
 };
 
 static const struct {
@@ -261,7 +275,7 @@ static int gpy_mbox_read(struct phy_device *phydev, u32 addr)
 	if (ret)
 		goto out;
 
-	cmd = VSPEC1_MBOX_CMD_RD;
+	cmd = FIELD_PREP(VSPEC1_MBOX_CMD_MASK, VSPEC1_MBOX_CMD_RD);
 	cmd |= FIELD_PREP(VSPEC1_MBOX_CMD_ADDRHI, addr >> 16);
 
 	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_MBOX_CMD, cmd);
@@ -287,6 +301,46 @@ static int gpy_mbox_read(struct phy_device *phydev, u32 addr)
 	return ret;
 }
 
+static int gpy_mbox_write(struct phy_device *phydev, u32 addr, u16 data)
+{
+	struct gpy_priv *priv = phydev->priv;
+	int val, ret;
+	u16 cmd;
+
+	mutex_lock(&priv->mbox_lock);
+
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_MBOX_DATA,
+			    data);
+	if (ret)
+		goto out;
+
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_MBOX_ADDRLO,
+			    addr);
+	if (ret)
+		goto out;
+
+	cmd = FIELD_PREP(VSPEC1_MBOX_CMD_MASK, VSPEC1_MBOX_CMD_WR);
+	cmd |= FIELD_PREP(VSPEC1_MBOX_CMD_ADDRHI, addr >> 16);
+
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_MBOX_CMD, cmd);
+	if (ret)
+		goto out;
+
+	/* The mbox read is used in the interrupt workaround. It was observed
+	 * that a read might take up to 2.5ms. This is also the time for which
+	 * the interrupt line is stuck low. To be on the safe side, poll the
+	 * ready bit for 10ms.
+	 */
+	ret = phy_read_mmd_poll_timeout(phydev, MDIO_MMD_VEND1,
+					VSPEC1_MBOX_CMD, val,
+					(val & VSPEC1_MBOX_CMD_READY),
+					500, 10000, false);
+
+out:
+	mutex_unlock(&priv->mbox_lock);
+	return ret;
+}
+
 static int gpy_config_init(struct phy_device *phydev)
 {
 	/* Nothing to configure. Configuration Requirement Placeholder */
@@ -317,6 +371,7 @@ static int gpy_probe(struct phy_device *phydev)
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
+	priv->br_led_index = -1;
 	phydev->priv = priv;
 	mutex_init(&priv->mbox_lock);
 
@@ -858,7 +913,8 @@ static int gpy115_loopback(struct phy_device *phydev, bool enable, int speed)
 static int gpy_led_brightness_set(struct phy_device *phydev,
 				  u8 index, enum led_brightness value)
 {
-	int ret;
+	struct gpy_priv *priv = phydev->priv;
+	int ret, reg;
 
 	if (index >= GPY_MAX_LEDS)
 		return -EINVAL;
@@ -871,7 +927,21 @@ static int gpy_led_brightness_set(struct phy_device *phydev,
 	if (ret)
 		return ret;
 
-	/* ToDo: set PWM brightness */
+	/* Set PWM brightness */
+	if (index == priv->br_led_index) {
+		if (value > LED_OFF && value < GPY_MAX_BRIGHTNESS) {
+			reg = LED_BRT_CTRL_EN;
+
+			reg |= FIELD_PREP(LED_BRT_CTRL_LVLMIN, 0x4);
+			reg |= FIELD_PREP(LED_BRT_CTRL_LVLMAX, value);
+		} else {
+			reg = LED_BRT_CTRL_TSEN;
+		}
+
+		ret = gpy_mbox_write(phydev, LED_BRT_CTRL, reg);
+		if (ret < 0)
+			return ret;
+	}
 
 	/* clear HW LED setup */
 	if (value == LED_OFF)
@@ -880,6 +950,17 @@ static int gpy_led_brightness_set(struct phy_device *phydev,
 		return 0;
 }
 
+static int gpy_led_max_brightness(struct phy_device *phydev, u8 index)
+{
+	struct gpy_priv *priv = phydev->priv;
+
+	if (priv->br_led_index < 0) {
+		priv->br_led_index = index;
+		return GPY_MAX_BRIGHTNESS;
+	}
+
+	return 1;
+}
 static const unsigned long supported_triggers = (BIT(TRIGGER_NETDEV_LINK) |
 						 BIT(TRIGGER_NETDEV_LINK_10) |
 						 BIT(TRIGGER_NETDEV_LINK_100) |
@@ -1032,6 +1113,7 @@ static struct phy_driver gpy_drivers[] = {
 		.get_wol	= gpy_get_wol,
 		.set_loopback	= gpy_loopback,
 		.led_brightness_set = gpy_led_brightness_set,
+		.led_max_brightness = gpy_led_max_brightness,
 		.led_hw_is_supported = gpy_led_hw_is_supported,
 		.led_hw_control_get = gpy_led_hw_control_get,
 		.led_hw_control_set = gpy_led_hw_control_set,
@@ -1055,6 +1137,7 @@ static struct phy_driver gpy_drivers[] = {
 		.get_wol	= gpy_get_wol,
 		.set_loopback	= gpy115_loopback,
 		.led_brightness_set = gpy_led_brightness_set,
+		.led_max_brightness = gpy_led_max_brightness,
 		.led_hw_is_supported = gpy_led_hw_is_supported,
 		.led_hw_control_get = gpy_led_hw_control_get,
 		.led_hw_control_set = gpy_led_hw_control_set,
@@ -1077,6 +1160,7 @@ static struct phy_driver gpy_drivers[] = {
 		.get_wol	= gpy_get_wol,
 		.set_loopback	= gpy115_loopback,
 		.led_brightness_set = gpy_led_brightness_set,
+		.led_max_brightness = gpy_led_max_brightness,
 		.led_hw_is_supported = gpy_led_hw_is_supported,
 		.led_hw_control_get = gpy_led_hw_control_get,
 		.led_hw_control_set = gpy_led_hw_control_set,
@@ -1100,6 +1184,7 @@ static struct phy_driver gpy_drivers[] = {
 		.get_wol	= gpy_get_wol,
 		.set_loopback	= gpy_loopback,
 		.led_brightness_set = gpy_led_brightness_set,
+		.led_max_brightness = gpy_led_max_brightness,
 		.led_hw_is_supported = gpy_led_hw_is_supported,
 		.led_hw_control_get = gpy_led_hw_control_get,
 		.led_hw_control_set = gpy_led_hw_control_set,
@@ -1122,6 +1207,7 @@ static struct phy_driver gpy_drivers[] = {
 		.get_wol	= gpy_get_wol,
 		.set_loopback	= gpy_loopback,
 		.led_brightness_set = gpy_led_brightness_set,
+		.led_max_brightness = gpy_led_max_brightness,
 		.led_hw_is_supported = gpy_led_hw_is_supported,
 		.led_hw_control_get = gpy_led_hw_control_get,
 		.led_hw_control_set = gpy_led_hw_control_set,
@@ -1145,6 +1231,7 @@ static struct phy_driver gpy_drivers[] = {
 		.get_wol	= gpy_get_wol,
 		.set_loopback	= gpy_loopback,
 		.led_brightness_set = gpy_led_brightness_set,
+		.led_max_brightness = gpy_led_max_brightness,
 		.led_hw_is_supported = gpy_led_hw_is_supported,
 		.led_hw_control_get = gpy_led_hw_control_get,
 		.led_hw_control_set = gpy_led_hw_control_set,
@@ -1167,6 +1254,7 @@ static struct phy_driver gpy_drivers[] = {
 		.get_wol	= gpy_get_wol,
 		.set_loopback	= gpy_loopback,
 		.led_brightness_set = gpy_led_brightness_set,
+		.led_max_brightness = gpy_led_max_brightness,
 		.led_hw_is_supported = gpy_led_hw_is_supported,
 		.led_hw_control_get = gpy_led_hw_control_get,
 		.led_hw_control_set = gpy_led_hw_control_set,
@@ -1190,6 +1278,7 @@ static struct phy_driver gpy_drivers[] = {
 		.get_wol	= gpy_get_wol,
 		.set_loopback	= gpy_loopback,
 		.led_brightness_set = gpy_led_brightness_set,
+		.led_max_brightness = gpy_led_max_brightness,
 		.led_hw_is_supported = gpy_led_hw_is_supported,
 		.led_hw_control_get = gpy_led_hw_control_get,
 		.led_hw_control_set = gpy_led_hw_control_set,
@@ -1212,6 +1301,7 @@ static struct phy_driver gpy_drivers[] = {
 		.get_wol	= gpy_get_wol,
 		.set_loopback	= gpy_loopback,
 		.led_brightness_set = gpy_led_brightness_set,
+		.led_max_brightness = gpy_led_max_brightness,
 		.led_hw_is_supported = gpy_led_hw_is_supported,
 		.led_hw_control_get = gpy_led_hw_control_get,
 		.led_hw_control_set = gpy_led_hw_control_set,
-- 
2.39.5


