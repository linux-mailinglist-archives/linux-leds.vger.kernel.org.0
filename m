Return-Path: <linux-leds+bounces-6729-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCQ3HQIedmn2LwEAu9opvQ
	(envelope-from <linux-leds+bounces-6729-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 14:43:30 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E02980C2B
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 14:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5186630010F6
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 13:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814C531A545;
	Sun, 25 Jan 2026 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkkAQa8p"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B26232143D
	for <linux-leds@vger.kernel.org>; Sun, 25 Jan 2026 13:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769348598; cv=none; b=jEfKZJfbfVciKS7lOOxyYrorwZeIbkXIzdKdkEKm3QCRBiSC4C4iBhFLghQPOCibof0ur5NQs6PeF2Q/3XvBlIVlix5TQ3TSQ4YbFamp5Qatru6tp+kgWVn6/832FNGyqK0h1AapJ1C8r58E0Z4qcvUdAZbdYf/+I5jcpYY0LxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769348598; c=relaxed/simple;
	bh=hHWILRyUU54F+w7k7JPriQ6DmoCAg8TcBCDlQKA/teg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBr6p18c2LOk5SF6LGGpZHtgo1PZuDEsc0laQFjObNi4fyHtjBWJ2vvZFuGmfqkYHNSDfJt5LYUKZRmXZyREACtiyyTlsJ7QWYOkvdVaRSagDLK2XRAXqzVUIqwMb0stbQ63L808OJyiEagJGvk+51J+Ywvmh0dPg8zVDnycH08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkkAQa8p; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-4359019da8cso3318514f8f.1
        for <linux-leds@vger.kernel.org>; Sun, 25 Jan 2026 05:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769348595; x=1769953395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SM6Glg7veqcWlsyKtZF2bdqamcvshEMVFBWJQkCFRkQ=;
        b=KkkAQa8pk+K6A4UYfw61ESplTSO1FwqHE9aWvDVpOPFwJQUIV+ln1LAaxk9fNgE+/R
         YhbIncZI9Pw98gLno0610Y7X0NQoHNoQ3lHfnAk0iibeXhmb1IPqq9KG/c2Zf6n7Tfwe
         qN9bfojsh3di8hOMJZFAS6w6/EzcXzB4Ee/+VZxVQN6vlvLxwBcn6zaNniQ/CYEiTmtM
         0JWww2zno2CHh8zFkVEJQtdgqYqIPwIm19S8s+kbceNAumA5ImVckrxzgGXsOcBSMdId
         gNJKd9WT2DQGKHYKDbBwrA9RxSpjEeVvgJCCofbrCLUI+79fEISSdkb4VOWNcucjMD/K
         Ou5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769348595; x=1769953395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SM6Glg7veqcWlsyKtZF2bdqamcvshEMVFBWJQkCFRkQ=;
        b=bBxkrBTQ5/BFaTXToU9ioZHHbZaoqstlHY3LpO5u4kFdmQJs4qO1NeXhWkdUlWuZBq
         URPetA+Bd+mWg5OaZqoDuj0j3uetKDUZtFWH02vbYunx3Mx3obOo5LDRgfzen05FZJEC
         1/AL3QX6B3AW9Q8lXr4xvzQe4DnF9JiqHdT+d9sqWs4GWHm2XQmyUjzdW6cyXjEAqC6C
         xNENHIQSl2rQI0iogiLZuGyw2j3DCpo/37s9XmgxucMIGZmvWnbNT9TJUaHSaPcwqb3Q
         KcKHkbl+TsFGEnw5fgzrdJqa71hG/toEJZCxXv4pQ2Vq/hkPTXHREK0Y68hB+zv8Lh2C
         0H2g==
X-Forwarded-Encrypted: i=1; AJvYcCWoOv3qihB4mmIT0qmo1vK6YJIH2kbIklvPzMB9PN0zcA5dhLJKIUBQn8n4yKkRIxyFfJ+J5SDt/VWw@vger.kernel.org
X-Gm-Message-State: AOJu0YzJfhUXsgqlXMFS87WH5krzwNv+oODt0Q6lnREl75itXQZ0g2jc
	ICqB7HPyUYvCPlc+RxLH4Y53jluSf5sQW4Gt/LNGVoAavesGcaJd+on5
X-Gm-Gg: AZuq6aLOEJUDAGHIximEqKPIsuHXyQZqiI702Xcr2AeN086tlurgszSR5xijKA1j0Bh
	TgLuMBw/Z4Fv+wAY9JylUG8glTUtOCp7aYcjJqCGOJMM5wEhsbVc0IVIbmytdGIuZrYnU+USGnD
	MfCOAissAvlAWVx30h58oI/ryZFev9+MuCWk1Q0GzgXiHusMpTD6FWKmTtiOU5ayR5AL6If1Srj
	bu9r3103RGmsGyKetcrM0sL/fSMHwC6gmq6OfWzGM+PP2/zP2ixF2ilrbpU5XeiAEuOW2qRutvk
	/fKPknJMv0RXmy8yfZKo4e/TLzzosvKahXfolPToRGwSF3VDQ/obuLdmc9WeGYYJH+FC+7KSxky
	+PsVX5hmBtNJL6RPT2UxoBbAXSIQWHaFOaXxd5oPmCkiJucXj9KStGZqBrvNCD2qcGRT2ZRrHrx
	ej
X-Received: by 2002:a05:6000:2506:b0:435:b020:30a3 with SMTP id ffacd0b85a97d-435ca39b3c7mr3408860f8f.54.1769348595045;
        Sun, 25 Jan 2026 05:43:15 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm22459688f8f.10.2026.01.25.05.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:43:14 -0800 (PST)
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
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v1 03/10] dt-bindings: iio: adc: cpcap-adc: document Mot ADC
Date: Sun, 25 Jan 2026 15:42:55 +0200
Message-ID: <20260125134302.45958-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125134302.45958-1-clamor95@gmail.com>
References: <20260125134302.45958-1-clamor95@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6729-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,bootlin.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5E02980C2B
X-Rspamd-Action: no action

Add compatible for ADC used in Mot board. Separate compatible is required
since ADC in the Mot board uses a unique set of configurations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
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


