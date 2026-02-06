Return-Path: <linux-leds+bounces-6870-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDBJAnolhmlSKAQAu9opvQ
	(envelope-from <linux-leds+bounces-6870-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:31:38 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DCE1010F2
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6905300BE9E
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 17:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A37426D24;
	Fri,  6 Feb 2026 17:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEpGYbG1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC50D426D1C
	for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 17:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398964; cv=none; b=VL4cFv3232t/2Wb+Ux9My4dpJdwjAc90PX1Gn+wmQFbyckZywNXOwRVVTEA7u0okLVIFW/nQ5swBxRVaMUSItoadRJkbR41oxTpc9AfoHz8lMCvJ4Jjr33X4vrUFaCCND3SlcJ/JgFKV/zTWlDwoN5/ny2g8CgdYNPERfJgieyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398964; c=relaxed/simple;
	bh=JmoAM65kp4SCHWds8aEZYvgwgyS/3LXvEs/CupbV0Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cg6pi0ijpsHiQmVx13j9/jfqm5OE8Ltna4+fhmv03kmK11nhQELD6btaD9i7HQd+El0k3zQ3/23+17XyhuBsDGeGx9E5+YrzOx3SxYPWoFd1s/qJuXstRvNgvlkqoyqfU4XUKDH/Lk/5Efp60dQlGGcejKOXCzCkyKC6Oee5qcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEpGYbG1; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-4362c932df8so576903f8f.1
        for <linux-leds@vger.kernel.org>; Fri, 06 Feb 2026 09:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770398962; x=1771003762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHanamLMxlv1uWVeIDwySoE8PM7DR+kxlL5JLXtsy0o=;
        b=dEpGYbG1Bo30cStqn4SNvOPvz9HQ1AJN1IirUXq8oTBCshw43DTVJtsAv+yPHmjL1c
         HDUOvQLLi/HYqrR5JAdhYmPoH4v3cAjCMn7kZDLe6oyITaUeQIvbaeg/SDfMHz5tdy/Y
         bSaVKqW73bBaOzjndCN8Btk4WZ6+uORXX41gd5hF2EmVNWO4nweFfUTEoAfDzmPveCBS
         YtXY/+lcHQpE9QlUefAU88KyhkslcSivoP9NVGHAuyRHrkfeJQREzvXgFMlmb7zP4z1W
         aQFrnXm0pImEs4Il5Qf6eQmHoRtfoo0s4LwaJGdqZm7Rm+13COKTQUkHeAHG2SUVcNKR
         FjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770398962; x=1771003762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yHanamLMxlv1uWVeIDwySoE8PM7DR+kxlL5JLXtsy0o=;
        b=U65/KCocBbpZzPeLwFGmfvG4CaQ07u/jWTIF6cVv1uRFfbKVZ84zekBKeubajddWSO
         KWxlgoEjYH5jRzHwvUan9SsXlqb4iRM/mv8DzFjIPAO9uZIWnnfWEQTAkHHNU3bKNMSo
         JP46JGlDlyvfmlUHRH9JZM5DoTcyOsDfEKdgRMM5NTeM5IB6xLyrLbCYwVjJTZ0ML+x2
         1U5TaMpKajbVNX/5wdNkdzmdQxhvYqeJxXNl0tdTt4EDd9q26UWhkbySIWl2zO6y3MJB
         YFz6r0UXO4KcQaN7q9NUH9KdTBXb6rBmqE4eXaZr1TNEnYp1JzYxz0oUxUYP4WzcWW9C
         G6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWaA9+bpns188VDq1kxmAbwJ6cUUCBXoPm5Fx5EvCheXhcDzODz2u6/Wz9HNqiA8CsSOe8Jomh5ar1c@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/LMBiWJvOZReOMp617QAWvP9fnBDhx5NXDgh1cBrigg3TC0gb
	mtlKcQqa3LVVItycAs398k2dwA3XgcZKpDdFssfSWrHp2+rKUWtzpaOV
X-Gm-Gg: AZuq6aJWzs89dOTWzZlilenDsSZG5tPOY3tZ2yaYbmkBkVyoFXns179CVVDclfCiFWo
	GC0kiM6Ib4IAH6ya/ujK5vqHU0xVs7d0pq+GJCpptdNzxWJORJyygjrqfzxt28ujBlFRTqElQ9m
	72ANHzBWeQnSik5hk9HsAv5wJNtlMdYlKoBjmg5NtYqK517hu8NC+uJTCruFhT/hUE0YmJFXbul
	iDzQC+SWODAsrIlSOmKGMuJW83JTYil5SEOCD8llCqIbM6WE90qVTVB29pWP0xDgso2Fq3Iy/SR
	nz1jlXLXf6Xi4KZVHQBEcLqvz+sTcrkfqSxShCReg9eE4WihhfEgZ6S4lurzX2ZQkfvOB4zc/oO
	wXaAWJmWl3bhts+gNcn+tD/3r1HOAodtvx5R8DNyrsQulDrosdJQ7Q3w5TNXLBemcdAQ5uJ5Bva
	Dn
X-Received: by 2002:a05:6000:25c5:b0:435:a160:4480 with SMTP id ffacd0b85a97d-436293b3972mr5583800f8f.29.1770398962093;
        Fri, 06 Feb 2026 09:29:22 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629734268sm6846033f8f.24.2026.02.06.09.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:29:21 -0800 (PST)
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
Subject: [PATCH v2 09/11] dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
Date: Fri,  6 Feb 2026 19:28:43 +0200
Message-ID: <20260206172845.145407-10-clamor95@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6870-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 69DCE1010F2
X-Rspamd-Action: no action

Add compatibles for Mapphone and Mot CPCAP subdevice compositions.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
index 7e350721d9f6..714d2645d6b7 100644
--- a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
+++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
@@ -17,6 +17,8 @@ properties:
     enum:
       - motorola,cpcap
       - st,6556002
+      - motorola,mapphone-cpcap
+      - motorola,mot-cpcap
 
   reg:
     maxItems: 1
-- 
2.51.0


