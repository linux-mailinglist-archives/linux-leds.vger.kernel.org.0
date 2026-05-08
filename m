Return-Path: <linux-leds+bounces-8056-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCmzAi0B/mkBmAAAu9opvQ
	(envelope-from <linux-leds+bounces-8056-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 17:28:45 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A4E4F8AFC
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 17:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8BD530889DC
	for <lists+linux-leds@lfdr.de>; Fri,  8 May 2026 15:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9BE3EAC87;
	Fri,  8 May 2026 15:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQQf0al+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431503FCB1C
	for <linux-leds@vger.kernel.org>; Fri,  8 May 2026 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778253997; cv=none; b=WAUAhBmGdWZIZgrv8cG4cWo8N+AZVnQjS78w2HKR36rNOhP44E7rBEbfr7vbbUwVl04g3VK8N3f4ksVkLAe+BSmycVDtyWWmOgzYGia7wtObXc7XqZ2GYcgLoMqF2Q3GxohHA8qvor/AxBT2rLWXKiw5pnaOZI9rM7OnlfbPznA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778253997; c=relaxed/simple;
	bh=8Qwf36rId+Ems/1eDwX4FkjrATBDA7Znl2SUcpy1ZKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=klDrevk1V4YGGtYKXxznn2igEiDFRImuC+8NICY2ofzJ8abxdgGbGsT05eFsRvLjIplZOVny5Z0nhiI/XYd/E1M4FxkDuQl3QufQ+jOPJMViSlY6P7aZeQuLlFbIpa+F8gLn8C6TZzEScrxWxqIutoVHtQXLkQTqCncBQtJNrR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQQf0al+; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ee990e8597so3709204eec.1
        for <linux-leds@vger.kernel.org>; Fri, 08 May 2026 08:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778253994; x=1778858794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8eLQlhXdKYRqwLg4DykUyxCfZQPw4q7VqcTUbCsSV0=;
        b=gQQf0al+Ql9V8ivsZYRc9GP4KYBcCsvgTIgyDeuSEae7IsHOKlyQ4IfUc5Euslx4eJ
         WBSYsD6FzKaQWBfYutn6tqQRKqkYox/Te07X2cODbclAcIEHpixlOvB+Zl/pQR9m0kxV
         cExVgIaxzU1cqb15oWo5pvV7q5VbiYXn0GwpDg/Du5fcd9wDrMZXwFhrotsoPgg8X4se
         jJ6IfMRATVuYBUkaq/tp5d/QNeP8ySzZ/ixmLSm+aTvHL43WP5fw1OkB82KuIAuhUDfZ
         LffHzPkvMZNnx/9WegllhOxvECbIRV4kHXmEsly78Xs3AdlOYnYN0kCW9SGV6eTktOGD
         8uBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778253994; x=1778858794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R8eLQlhXdKYRqwLg4DykUyxCfZQPw4q7VqcTUbCsSV0=;
        b=TyBSvrr4ll4LD54B3F1ehL4D7mSRrmiDyQGGW5III3otKX9hlMwpuPRMvdzBDKXF8t
         sxoES56r/tVX8+4JswDIcOTwSBz4CB/uRftHN1dkT13qNZnL2hA+q/G81yHWOCWOmnhh
         wrtgAWXZROzKTnfIIfywWBQGClaZD1d6sjjeuQp74cf+W+k7LbOBh8qKaCYgRx9RtJSV
         HCqh76z45oNbQgW3nbVj08Xc6odDxeHeUNGyZ4+q504DtyDpVMxqfCECTXvUBaN8KeTC
         XWN9r2YZkBV3wcw0MiKok+VYwWDd0VqflxbJ+Xwj8ZzhPQzAWhknwVz60yuNeqqMNFV8
         3CYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SsMBPXBPfACM0XLceCVA/SNAmlCZGAhYS9iDyTGRf1XYoWD2PhM7lHrcHe+SfwBk/HEDkhHZHEKKx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcd/MSvjpM9GoQF6TL/uw45KRBxlVGcX2oDbpoKERBKwb3rB7g
	trxLjDmdXHW7U8AOgoetARQhDZ6BiHNjwNg6JmsYjiL7um23BzUlw244
X-Gm-Gg: Acq92OHzjvWldBRPBX1DscPKHUCojXJPD4wVYYWFmhEwjXHPg2/bIyRfLTco5jIjqqR
	6fY7MH+euhb0j8+sEskz3yWxkobTxbAgUhly6BhhlBQl9N+erDQVYFc+rBLY+fPf8Ja1VnN95G4
	YmYa2v6SEqkAjaQi57Ojw1yG6F52XAYfHVNdwM49On9mU+3ORVYkxfEouWTTX8rWgcdUZlDy17u
	pjNN4nfVNraKb0eiwh+0LhNu4Pj/jjDPk5kgcehOAhZkAX9GRLKUjFG/ocsLqMD6DVfEa9iYN8m
	E7QF45xT3DiOn25FvO1ccOgPZISR+A9bpxAwuHHDdRSUUYEpNRyTJHb2zUhVKzzYcCJoymDZ+sX
	RbbIY7ecXMIjOieFeLVwdkQfeF9JTtcFgzeMdD2NAqCydx61cE99a5uV2kQpW9dUtrk+68ZvrTY
	/vSyXT/ZQOYDLqVlcgxCPzOtGfOLLU4mD0+wkO0F9Rn+dwzRc=
X-Received: by 2002:a05:7301:1014:b0:2f9:5c29:ffb6 with SMTP id 5a478bee46e88-2f95c2a01a1mr155628eec.13.1778253994365;
        Fri, 08 May 2026 08:26:34 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:26:34 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Romain Perier <romain.perier@gmail.com>,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Peter Rosin <peda@axentia.se>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Paul Barker <paul.barker@sancloud.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/5] leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant startup pulse
Date: Fri,  8 May 2026 23:24:19 +0800
Message-ID: <20260508152435.21389-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 78A4E4F8AFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,ucw.cz,kernel.org,hisilicon.com,sancloud.com,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-8056-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,tkos.co.il,st.com,axentia.se,sartura.hr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lumissil.com:url]
X-Rspamd-Action: no action

1. Per IS31FL319x datasheet [1], the hardware shutdown pin (SDB) is
active-low.

Fix incorrect initial GPIO level to properly release the chip from shutdown
state.

2. According to datasheet [1] definition:
  Shutdown mode can either be used as a means of
  reducing power consumption or generating a flashing
  display (repeatedly entering and leaving shutdown
  mode). During shutdown mode all registers retain their
  data.
shutdown mode does NOT perform chip reset.A dedicated software reset is
already implemented in driver by writing 0 to reset chip.

Remove redundant unnecessary toggling of the shutdown GPIO.

[1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf

Fixes: dddb4e38c6ba ("leds: is31fl319x: Add shutdown pin and generate a 5ms low pulse when startup")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl319x.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index e411cee06dab..c947f844c756 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -396,7 +396,7 @@ static int is31fl319x_parse_fw(struct device *dev, struct is31fl319x_chip *is31)
 	int count;
 	int ret;
 
-	is31->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	is31->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
 	if (IS_ERR(is31->shutdown_gpio))
 		return dev_err_probe(dev, PTR_ERR(is31->shutdown_gpio),
 				     "Failed to get shutdown gpio\n");
@@ -506,12 +506,6 @@ static int is31fl319x_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	if (is31->shutdown_gpio) {
-		gpiod_direction_output(is31->shutdown_gpio, 0);
-		mdelay(5);
-		gpiod_direction_output(is31->shutdown_gpio, 1);
-	}
-
 	is31->client = client;
 	is31->regmap = devm_regmap_init_i2c(client, is31->cdef->is31fl319x_regmap_config);
 	if (IS_ERR(is31->regmap))
-- 
2.54.0


