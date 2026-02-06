Return-Path: <linux-leds+bounces-6865-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FUILSQmhmlSKAQAu9opvQ
	(envelope-from <linux-leds+bounces-6865-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:34:28 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3065A1011E7
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8431830A65A1
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 17:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E893A42188A;
	Fri,  6 Feb 2026 17:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAlnoLPS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C69341B378
	for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 17:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398955; cv=none; b=JqeO7X8Jdk/C2yEHxnMRZzk8gpKyAW+Ca5yIzjTuREG2fpTk2onpO5QsBppmhwi4alAjZheI31DIjk8LS9fEQcjxW8cZk6i0IMTf2O1imPX8XJckTyWKTQgt3N8baaXH6HTj5qwLWHnlpwgYqiQ5e80z0y3Zh2xgdlXd2tI2P90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398955; c=relaxed/simple;
	bh=X4OCnQEpeJBorGqYXoi+7J81mCo8rWEmlgZBzdUxnPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LOL+kIun3X1C2v6uQFb84fF7lj22tuG7Xv/BtK797/n/fe4IrCDzgJ8ZiT5/cSEUacis7Ce5HrIBcgdVdCWHGTW1T/gr3dJ2szDseSP1FH5DUEACJcrz5KXBNpagBziqQ1K92GVZ2VvKw1NvGo5+Js9yz/mSFciBFLEfdW+uvjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAlnoLPS; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-4362ab556f5so720863f8f.3
        for <linux-leds@vger.kernel.org>; Fri, 06 Feb 2026 09:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770398954; x=1771003754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxB3vH0iuOXdnI22F4EJHvjyJ371rVhhdGFC5x7FW5o=;
        b=FAlnoLPSlM8dtR82duwvTKydAMNVEJ7Bc4wOmX8xhb9085zI3CzfT5/HmfpvjLr9Ts
         Hm77f7JOfB3lqeefu/AGkeSSUKRSZ2uYBZYRo0+opD3k23ZwJHa3rzZyTuPcBGYJS6XO
         VBgy9TYCmjjOcOymRhLR8GeTOyWBJIOi2QtlmK+wkfM6gR0350m4n8RKlSL/Dmf/ONIa
         Y89qkcXLPoFNesVkYVIfSBIhfKshsuNn1dvSxmD3HA2F5h7wQ+EJCVaYAOTlBhSEAkKO
         d6FpYOtT/nIoyGY4PStK2aW+e8fg06UrBsYmir5v4vb1s7UZTO550QaP7nPcMB2A3npj
         8rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770398954; x=1771003754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xxB3vH0iuOXdnI22F4EJHvjyJ371rVhhdGFC5x7FW5o=;
        b=aA/w1cTC2PDeVeBSXcQBS8rKoUFZOdxzB7RgdgjwVZhKoGdasYUEv89J0Gyh0i4czI
         x6gN3f2er3IIQJmhlRZ0CQrRzUMH2uDBbo6vV+yjaDULvV8CPK4OvVAQGCc8qxp4Xs87
         m82rTickfJm1gwUl0Z8fzUVTet3jX/JDtgSCQ/yiaXQWCi2AcqPvpVxT40+VfmbDhVtY
         Yddq7r18OovZm/OXIC84oEIawVn2I2CxibTSNmjTHI7zDf77Wwkca1poYeyFcTbCHV66
         Hn3h3p9h9vBx6koZ9//hf4ffeGMaA0VCz5ozLR5KWkt1X667vGacbekUEGqSzdIt7j90
         zZHw==
X-Forwarded-Encrypted: i=1; AJvYcCV8cioBsKFN7OOSKJ0/iYOLSNmK3Y5iU8r+0oCQI8ginavypTHWFiJNd62Clt42X8Mk3ZKYDcE1TKj2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk2YZiIuveezEVAc+wJ8VFu2bp6IQfEAov7+itNornOzwF7dEb
	FPGLCKe8wAjuV9no1hBt9iBWSBkj75Pu7C8Wgi4517HS6wehwg7LHdj7
X-Gm-Gg: AZuq6aJF8D+C2ihSNP0P5j8sOFRWvUgjaej12Gmj65JPk6GkE57E3l8mau78EMeT031
	9DcjoRESI44//zYhSNr9qgYL59USAQAW8Q+t60yosGP/2K1heGlTu0lO0JdmGEAYeAmVLIjzw2S
	zJ5u6SYoKIOs3UjeHgOV5TBO93UsOs9Jd3VmQfbfx5JqSRFet8Obg4Vs3gTUs/eQ2zQjmwIJ+eT
	X4vdmYs+ddnK0SePRYtNHPFcsrQXbQ+GntnRh/wWbb3viDVZw4yUXdUzrMlw9EHEhcdyJ6drz+9
	pkuD9g8sCvueeaUwcL4yHuWC9HiRhTSSOKE0oQ7RF0jJBx9jSgL0Fj1BQQ6Q0GHklJdYoJhOVQD
	iy5ydEH7i7SWicmQexbx5FLRNth4gxQMgigewgAU48gf501wpTRKLDdz2QRtOsrPaDeD1mBvucW
	85
X-Received: by 2002:a05:6000:1445:b0:432:5c43:76 with SMTP id ffacd0b85a97d-4362967e34bmr4965535f8f.39.1770398953684;
        Fri, 06 Feb 2026 09:29:13 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629734268sm6846033f8f.24.2026.02.06.09.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:29:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 04/11] dt-bindings: iio: adc: cpcap-adc: document Mot ADC
Date: Fri,  6 Feb 2026 19:28:38 +0200
Message-ID: <20260206172845.145407-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206172845.145407-1-clamor95@gmail.com>
References: <20260206172845.145407-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6865-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3065A1011E7
X-Rspamd-Action: no action

Add compatible for ADC used in Mot board. Separate compatible is required
since ADC in the Mot board uses a unique set of configurations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml b/Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml
index 9ceb6f18c854..1f77da7f8e06 100644
--- a/Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - motorola,cpcap-adc
       - motorola,mapphone-cpcap-adc
+      - motorola,mot-cpcap-adc
 
   interrupts:
     maxItems: 1
-- 
2.51.0


