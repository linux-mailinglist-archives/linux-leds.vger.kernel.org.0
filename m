Return-Path: <linux-leds+bounces-545-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 308E1825538
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jan 2024 15:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFB7E1F23CD1
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jan 2024 14:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9CD31758;
	Fri,  5 Jan 2024 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqS4T71y"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C008D31A89;
	Fri,  5 Jan 2024 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40d87df95ddso14271575e9.0;
        Fri, 05 Jan 2024 06:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704464865; x=1705069665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RPN76dImVZ9qk/dQRb5vSc4CF59XSeyiqnxzvzXS/Y=;
        b=QqS4T71y7Bz51SUtMnGpadueGoVE5VOo23pnWLtWqaflXoHy/1vU3xg9K0j3ZeZfIK
         CazyvZmJqyzEMONNTo3B/JfMhabGaIUST1jFdsuOrHs7niCN5aVyn6Zxu4AbClmxqDkC
         0CoF0YVA37HETm1YV7pDoYIx74Nro72gg5H8tw8ap7BLQNGKzchb4Op06efHP1rAdDeW
         C7AJmNguSrGFLN8LzCgGt/jDoTC4yKm//GgPD71twbUToecJMT9+Yjf/WFHNmMc8DLUu
         PjIz+IejXWi2RO7WKLc7M+9Gquk/c9d5A/OnIFqb8+eX/lfRtUA6RcY3E4IVDb3BvMJ4
         i59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704464865; x=1705069665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RPN76dImVZ9qk/dQRb5vSc4CF59XSeyiqnxzvzXS/Y=;
        b=LjA/Eu9vEUr3Pg4QIA2nEf4lwkwvvm/wgaT26lwK4BH5JY8LxOgunrwL3+obzKDRb7
         vj8YhkiWQ5icZrDqIm1c0M1lIuT9gl/IHUG87xs0Lcn+fDP+UIDP1R5gIEG1MY3VjbPF
         a1Pt6x8CQXZhG5IoH5R7uNdZJKl/YznizvW3QbkRKP19AMWErSoG1FA1Xzp1yWimE7xr
         8OrEdEme4aXwuKyo/1UBcSUqlIuVq5WAlaUFDXmTpdLUu4jEhxirclIptza9CTgX1T4z
         AJK3XNINbsGUAXdmpxm9bJkZY2NUfdDvbPoaZML7te8ek0UXhOhLajMqM1xcsKGd+ynD
         FZgA==
X-Gm-Message-State: AOJu0YzJjKzX6okc41Cs2n9E6nIQv2wAdEJFs0hUKKGEQTqNNi25Q2PD
	RCtpFhmPPj1M6BysMgOokCs=
X-Google-Smtp-Source: AGHT+IHu43QPGzQCbul+r4WQ159aXXuoPh/GzOxgYPcbOIyFUJK74U+H5XDij62VuYdOLrBqbfP+yA==
X-Received: by 2002:a05:600c:4f4e:b0:40d:5f3e:e985 with SMTP id m14-20020a05600c4f4e00b0040d5f3ee985mr642484wmq.154.1704464864973;
        Fri, 05 Jan 2024 06:27:44 -0800 (PST)
Received: from localhost.localdomain (host-80-116-159-187.retail.telecomitalia.it. [80.116.159.187])
        by smtp.googlemail.com with ESMTPSA id j10-20020a05600c190a00b0040d87100733sm1721901wmq.39.2024.01.05.06.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 06:27:44 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	=?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [net-next PATCH v9 5/5] net: phy: at803x: add LED support for qca808x
Date: Fri,  5 Jan 2024 15:27:17 +0100
Message-ID: <20240105142719.11042-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105142719.11042-1-ansuelsmth@gmail.com>
References: <20240105142719.11042-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add LED support for QCA8081 PHY.

Documentation for this LEDs PHY is very scarce even with NDA access
to Documentation for OEMs. Only the blink pattern are documented and are
very confusing most of the time. No documentation is present about
forcing the LED on/off or to always blink.

Those settings were reversed by poking the regs and trying to find the
correct bits to trigger these modes. Some bits mode are not clear and
maybe the documentation option are not 100% correct. For the sake of LED
support the reversed option are enough to add support for current LED
APIs.

Supported HW control modes are:
- tx
- rx
- link10
- link100
- link1000
- half_duplex
- full_duplex

Also add support for LED polarity set to set LED polarity to active
high or low. QSDK sets this value to high by default but PHY reset value
doesn't have this enabled by default.

QSDK also sets 2 additional bits but their usage is not clear, info about
this is added in the header. It was verified that for correct function
of the LED if active high is needed, only BIT 6 is needed.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v9:
- Fix copy-paste error for blink settings
Changes v8:
- Drop unused ret variable
Changes v7:
- Improve set polarity settings (Suggested by Russell)
Changes v6:
- Rebase on top of net-next
Changes v5:
- Rework to polarity option bitmap
- Rafactor with new finding from further reverse
Changes v4:
- Rework to polarity option (for marvell10g series support)
- Rework logic to enforce single PHY polarity mode
Changes v3:
- Out of RFC
- Drop link_25000 and add TODO commends waiting for the
  netdev trigger thing to be merged (I will take care of
  sending a followup patch later)
Changes v2:
- Move to new led_polarity_set implementation
- Drop special probe

 drivers/net/phy/at803x.c | 325 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 325 insertions(+)

diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
index aaf6c654aaed..3e3a95e594c7 100644
--- a/drivers/net/phy/at803x.c
+++ b/drivers/net/phy/at803x.c
@@ -272,6 +272,87 @@
 #define QCA808X_CDT_STATUS_STAT_OPEN		2
 #define QCA808X_CDT_STATUS_STAT_SHORT		3
 
+#define QCA808X_MMD7_LED_GLOBAL			0x8073
+#define QCA808X_LED_BLINK_1			GENMASK(11, 6)
+#define QCA808X_LED_BLINK_2			GENMASK(5, 0)
+/* Values are the same for both BLINK_1 and BLINK_2 */
+#define QCA808X_LED_BLINK_FREQ_MASK		GENMASK(5, 3)
+#define QCA808X_LED_BLINK_FREQ_2HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x0)
+#define QCA808X_LED_BLINK_FREQ_4HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x1)
+#define QCA808X_LED_BLINK_FREQ_8HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x2)
+#define QCA808X_LED_BLINK_FREQ_16HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x3)
+#define QCA808X_LED_BLINK_FREQ_32HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x4)
+#define QCA808X_LED_BLINK_FREQ_64HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x5)
+#define QCA808X_LED_BLINK_FREQ_128HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x6)
+#define QCA808X_LED_BLINK_FREQ_256HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x7)
+#define QCA808X_LED_BLINK_DUTY_MASK		GENMASK(2, 0)
+#define QCA808X_LED_BLINK_DUTY_50_50		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x0)
+#define QCA808X_LED_BLINK_DUTY_75_25		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x1)
+#define QCA808X_LED_BLINK_DUTY_25_75		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x2)
+#define QCA808X_LED_BLINK_DUTY_33_67		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x3)
+#define QCA808X_LED_BLINK_DUTY_67_33		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x4)
+#define QCA808X_LED_BLINK_DUTY_17_83		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x5)
+#define QCA808X_LED_BLINK_DUTY_83_17		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x6)
+#define QCA808X_LED_BLINK_DUTY_8_92		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x7)
+
+#define QCA808X_MMD7_LED2_CTRL			0x8074
+#define QCA808X_MMD7_LED2_FORCE_CTRL		0x8075
+#define QCA808X_MMD7_LED1_CTRL			0x8076
+#define QCA808X_MMD7_LED1_FORCE_CTRL		0x8077
+#define QCA808X_MMD7_LED0_CTRL			0x8078
+#define QCA808X_MMD7_LED_CTRL(x)		(0x8078 - ((x) * 2))
+
+/* LED hw control pattern is the same for every LED */
+#define QCA808X_LED_PATTERN_MASK		GENMASK(15, 0)
+#define QCA808X_LED_SPEED2500_ON		BIT(15)
+#define QCA808X_LED_SPEED2500_BLINK		BIT(14)
+/* Follow blink trigger even if duplex or speed condition doesn't match */
+#define QCA808X_LED_BLINK_CHECK_BYPASS		BIT(13)
+#define QCA808X_LED_FULL_DUPLEX_ON		BIT(12)
+#define QCA808X_LED_HALF_DUPLEX_ON		BIT(11)
+#define QCA808X_LED_TX_BLINK			BIT(10)
+#define QCA808X_LED_RX_BLINK			BIT(9)
+#define QCA808X_LED_TX_ON_10MS			BIT(8)
+#define QCA808X_LED_RX_ON_10MS			BIT(7)
+#define QCA808X_LED_SPEED1000_ON		BIT(6)
+#define QCA808X_LED_SPEED100_ON			BIT(5)
+#define QCA808X_LED_SPEED10_ON			BIT(4)
+#define QCA808X_LED_COLLISION_BLINK		BIT(3)
+#define QCA808X_LED_SPEED1000_BLINK		BIT(2)
+#define QCA808X_LED_SPEED100_BLINK		BIT(1)
+#define QCA808X_LED_SPEED10_BLINK		BIT(0)
+
+#define QCA808X_MMD7_LED0_FORCE_CTRL		0x8079
+#define QCA808X_MMD7_LED_FORCE_CTRL(x)		(0x8079 - ((x) * 2))
+
+/* LED force ctrl is the same for every LED
+ * No documentation exist for this, not even internal one
+ * with NDA as QCOM gives only info about configuring
+ * hw control pattern rules and doesn't indicate any way
+ * to force the LED to specific mode.
+ * These define comes from reverse and testing and maybe
+ * lack of some info or some info are not entirely correct.
+ * For the basic LED control and hw control these finding
+ * are enough to support LED control in all the required APIs.
+ *
+ * On doing some comparison with implementation with qca807x,
+ * it was found that it's 1:1 equal to it and confirms all the
+ * reverse done. It was also found further specification with the
+ * force mode and the blink modes.
+ */
+#define QCA808X_LED_FORCE_EN			BIT(15)
+#define QCA808X_LED_FORCE_MODE_MASK		GENMASK(14, 13)
+#define QCA808X_LED_FORCE_BLINK_1		FIELD_PREP(QCA808X_LED_FORCE_MODE_MASK, 0x3)
+#define QCA808X_LED_FORCE_BLINK_2		FIELD_PREP(QCA808X_LED_FORCE_MODE_MASK, 0x2)
+#define QCA808X_LED_FORCE_ON			FIELD_PREP(QCA808X_LED_FORCE_MODE_MASK, 0x1)
+#define QCA808X_LED_FORCE_OFF			FIELD_PREP(QCA808X_LED_FORCE_MODE_MASK, 0x0)
+
+#define QCA808X_MMD7_LED_POLARITY_CTRL		0x901a
+/* QSDK sets by default 0x46 to this reg that sets BIT 6 for
+ * LED to active high. It's not clear what BIT 3 and BIT 4 does.
+ */
+#define QCA808X_LED_ACTIVE_HIGH			BIT(6)
+
 /* QCA808X 1G chip type */
 #define QCA808X_PHY_MMD7_CHIP_TYPE		0x901d
 #define QCA808X_PHY_CHIP_TYPE_1G		BIT(0)
@@ -317,6 +398,7 @@ struct at803x_priv {
 	struct regulator_dev *vddio_rdev;
 	struct regulator_dev *vddh_rdev;
 	u64 stats[ARRAY_SIZE(qca83xx_hw_stats)];
+	int led_polarity_mode;
 };
 
 struct at803x_context {
@@ -677,6 +759,9 @@ static int at803x_probe(struct phy_device *phydev)
 	if (!priv)
 		return -ENOMEM;
 
+	/* Init LED polarity mode to -1 */
+	priv->led_polarity_mode = -1;
+
 	phydev->priv = priv;
 
 	ret = at803x_parse_dt(phydev);
@@ -2161,6 +2246,240 @@ static void qca808x_link_change_notify(struct phy_device *phydev)
 				   phydev->link ? QCA8081_PHY_FIFO_RSTN : 0);
 }
 
+static int qca808x_led_parse_netdev(struct phy_device *phydev, unsigned long rules,
+				    u16 *offload_trigger)
+{
+	/* TODO: add link_2500 when added to netdev trigger */
+	/* Parsing specific to netdev trigger */
+	if (test_bit(TRIGGER_NETDEV_TX, &rules))
+		*offload_trigger |= QCA808X_LED_TX_BLINK;
+	if (test_bit(TRIGGER_NETDEV_RX, &rules))
+		*offload_trigger |= QCA808X_LED_RX_BLINK;
+	if (test_bit(TRIGGER_NETDEV_LINK_10, &rules))
+		*offload_trigger |= QCA808X_LED_SPEED10_ON;
+	if (test_bit(TRIGGER_NETDEV_LINK_100, &rules))
+		*offload_trigger |= QCA808X_LED_SPEED100_ON;
+	if (test_bit(TRIGGER_NETDEV_LINK_1000, &rules))
+		*offload_trigger |= QCA808X_LED_SPEED1000_ON;
+	if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &rules))
+		*offload_trigger |= QCA808X_LED_HALF_DUPLEX_ON;
+	if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &rules))
+		*offload_trigger |= QCA808X_LED_FULL_DUPLEX_ON;
+
+	if (rules && !*offload_trigger)
+		return -EOPNOTSUPP;
+
+	/* Enable BLINK_CHECK_BYPASS by default to make the LED
+	 * blink even with duplex or speed mode not enabled.
+	 */
+	*offload_trigger |= QCA808X_LED_BLINK_CHECK_BYPASS;
+
+	return 0;
+}
+
+static int qca808x_led_hw_control_enable(struct phy_device *phydev, u8 index)
+{
+	u16 reg;
+
+	if (index > 2)
+		return -EINVAL;
+
+	reg = QCA808X_MMD7_LED_FORCE_CTRL(index);
+
+	return phy_clear_bits_mmd(phydev, MDIO_MMD_AN, reg,
+				  QCA808X_LED_FORCE_EN);
+}
+
+static int qca808x_led_hw_is_supported(struct phy_device *phydev, u8 index,
+				       unsigned long rules)
+{
+	u16 offload_trigger = 0;
+
+	if (index > 2)
+		return -EINVAL;
+
+	return qca808x_led_parse_netdev(phydev, rules, &offload_trigger);
+}
+
+static int qca808x_led_hw_control_set(struct phy_device *phydev, u8 index,
+				      unsigned long rules)
+{
+	u16 reg, offload_trigger = 0;
+	int ret;
+
+	if (index > 2)
+		return -EINVAL;
+
+	reg = QCA808X_MMD7_LED_CTRL(index);
+
+	ret = qca808x_led_parse_netdev(phydev, rules, &offload_trigger);
+	if (ret)
+		return ret;
+
+	ret = qca808x_led_hw_control_enable(phydev, index);
+	if (ret)
+		return ret;
+
+	return phy_modify_mmd(phydev, MDIO_MMD_AN, reg,
+			      QCA808X_LED_PATTERN_MASK,
+			      offload_trigger);
+}
+
+static bool qca808x_led_hw_control_status(struct phy_device *phydev, u8 index)
+{
+	u16 reg;
+	int val;
+
+	if (index > 2)
+		return false;
+
+	reg = QCA808X_MMD7_LED_FORCE_CTRL(index);
+
+	val = phy_read_mmd(phydev, MDIO_MMD_AN, reg);
+
+	return !(val & QCA808X_LED_FORCE_EN);
+}
+
+static int qca808x_led_hw_control_get(struct phy_device *phydev, u8 index,
+				      unsigned long *rules)
+{
+	u16 reg;
+	int val;
+
+	if (index > 2)
+		return -EINVAL;
+
+	/* Check if we have hw control enabled */
+	if (qca808x_led_hw_control_status(phydev, index))
+		return -EINVAL;
+
+	reg = QCA808X_MMD7_LED_CTRL(index);
+
+	/* TODO: add link_2500 when added to netdev trigger */
+	val = phy_read_mmd(phydev, MDIO_MMD_AN, reg);
+	if (val & QCA808X_LED_TX_BLINK)
+		set_bit(TRIGGER_NETDEV_TX, rules);
+	if (val & QCA808X_LED_RX_BLINK)
+		set_bit(TRIGGER_NETDEV_RX, rules);
+	if (val & QCA808X_LED_SPEED10_ON)
+		set_bit(TRIGGER_NETDEV_LINK_10, rules);
+	if (val & QCA808X_LED_SPEED100_ON)
+		set_bit(TRIGGER_NETDEV_LINK_100, rules);
+	if (val & QCA808X_LED_SPEED1000_ON)
+		set_bit(TRIGGER_NETDEV_LINK_1000, rules);
+	if (val & QCA808X_LED_HALF_DUPLEX_ON)
+		set_bit(TRIGGER_NETDEV_HALF_DUPLEX, rules);
+	if (val & QCA808X_LED_FULL_DUPLEX_ON)
+		set_bit(TRIGGER_NETDEV_FULL_DUPLEX, rules);
+
+	return 0;
+}
+
+static int qca808x_led_hw_control_reset(struct phy_device *phydev, u8 index)
+{
+	u16 reg;
+
+	if (index > 2)
+		return -EINVAL;
+
+	reg = QCA808X_MMD7_LED_CTRL(index);
+
+	return phy_clear_bits_mmd(phydev, MDIO_MMD_AN, reg,
+				  QCA808X_LED_PATTERN_MASK);
+}
+
+static int qca808x_led_brightness_set(struct phy_device *phydev,
+				      u8 index, enum led_brightness value)
+{
+	u16 reg;
+	int ret;
+
+	if (index > 2)
+		return -EINVAL;
+
+	if (!value) {
+		ret = qca808x_led_hw_control_reset(phydev, index);
+		if (ret)
+			return ret;
+	}
+
+	reg = QCA808X_MMD7_LED_FORCE_CTRL(index);
+
+	return phy_modify_mmd(phydev, MDIO_MMD_AN, reg,
+			      QCA808X_LED_FORCE_EN | QCA808X_LED_FORCE_MODE_MASK,
+			      QCA808X_LED_FORCE_EN | value ? QCA808X_LED_FORCE_ON :
+							     QCA808X_LED_FORCE_OFF);
+}
+
+static int qca808x_led_blink_set(struct phy_device *phydev, u8 index,
+				 unsigned long *delay_on,
+				 unsigned long *delay_off)
+{
+	int ret;
+	u16 reg;
+
+	if (index > 2)
+		return -EINVAL;
+
+	reg = QCA808X_MMD7_LED_FORCE_CTRL(index);
+
+	/* Set blink to 50% off, 50% on at 4Hz by default */
+	ret = phy_modify_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_LED_GLOBAL,
+			     QCA808X_LED_BLINK_FREQ_MASK | QCA808X_LED_BLINK_DUTY_MASK,
+			     QCA808X_LED_BLINK_FREQ_4HZ | QCA808X_LED_BLINK_DUTY_50_50);
+	if (ret)
+		return ret;
+
+	/* We use BLINK_1 for normal blinking */
+	ret = phy_modify_mmd(phydev, MDIO_MMD_AN, reg,
+			     QCA808X_LED_FORCE_EN | QCA808X_LED_FORCE_MODE_MASK,
+			     QCA808X_LED_FORCE_EN | QCA808X_LED_FORCE_BLINK_1);
+	if (ret)
+		return ret;
+
+	/* We set blink to 4Hz, aka 250ms */
+	*delay_on = 250 / 2;
+	*delay_off = 250 / 2;
+
+	return 0;
+}
+
+static int qca808x_led_polarity_set(struct phy_device *phydev, int index,
+				    unsigned long modes)
+{
+	struct at803x_priv *priv = phydev->priv;
+	bool active_low = false;
+	u32 mode;
+
+	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
+		switch (mode) {
+		case PHY_LED_ACTIVE_LOW:
+			active_low = true;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	/* PHY polarity is global and can't be set per LED.
+	 * To detect this, check if last requested polarity mode
+	 * match the new one.
+	 */
+	if (priv->led_polarity_mode >= 0 &&
+	    priv->led_polarity_mode != active_low) {
+		phydev_err(phydev, "PHY polarity is global. Mismatched polarity on different LED\n");
+		return -EINVAL;
+	}
+
+	/* Save the last PHY polarity mode */
+	priv->led_polarity_mode = active_low;
+
+	return phy_modify_mmd(phydev, MDIO_MMD_AN,
+			      QCA808X_MMD7_LED_POLARITY_CTRL,
+			      QCA808X_LED_ACTIVE_HIGH,
+			      active_low ? 0 : QCA808X_LED_ACTIVE_HIGH);
+}
+
 static struct phy_driver at803x_driver[] = {
 {
 	/* Qualcomm Atheros AR8035 */
@@ -2337,6 +2656,12 @@ static struct phy_driver at803x_driver[] = {
 	.cable_test_start	= qca808x_cable_test_start,
 	.cable_test_get_status	= qca808x_cable_test_get_status,
 	.link_change_notify	= qca808x_link_change_notify,
+	.led_brightness_set	= qca808x_led_brightness_set,
+	.led_blink_set		= qca808x_led_blink_set,
+	.led_hw_is_supported	= qca808x_led_hw_is_supported,
+	.led_hw_control_set	= qca808x_led_hw_control_set,
+	.led_hw_control_get	= qca808x_led_hw_control_get,
+	.led_polarity_set	= qca808x_led_polarity_set,
 }, };
 
 module_phy_driver(at803x_driver);
-- 
2.43.0


