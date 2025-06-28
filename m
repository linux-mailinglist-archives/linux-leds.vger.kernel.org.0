Return-Path: <linux-leds+bounces-4911-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A788AEC8AB
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 18:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B88C63AD5AF
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 16:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1466256C7D;
	Sat, 28 Jun 2025 16:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsYEPdpn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483D5253B5C;
	Sat, 28 Jun 2025 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127540; cv=none; b=iDKdSpaj1yKepbGf7ENlwGVS0dE5Wo6Zr95/NNvjUuo/NTrXvgNMHbsP0EwO4fZbSOqzpbFW3gH+8FHc7Y34QiZncIKJyEqw9agGeoYwsQyRr8gB4zuLiT2wwhyJHOm5Uv85EcySO8N2h3Hte28Q2RsxK7sZAimuzU9a3Bjcjcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127540; c=relaxed/simple;
	bh=Bkb0DSpaKgNDotVl98+tkhn35EvYHk5lJQNuHDhpqR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V63LqYS9DENNyWA2r9b7z1hdG5mfwPgAGe1ZAxo1ltfDXlWgoQjc9YI1nSsPyDwk2fYaJ1S6QJ+M/FRZak5Gjl+kbQPULTBq7EurEUTgSbmzLk1S32vIa1aYGjhCZcYttX5BXuXTRrhVplONGwL2Gb1P44pu05Hf0HKDYV+Rgnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsYEPdpn; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6faf66905baso9747906d6.2;
        Sat, 28 Jun 2025 09:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751127538; x=1751732338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LKIa1UkIqEHYKA4TXZ32HlvxWrAPwqU+G93P95AKhM=;
        b=LsYEPdpnR6TVS2jeGiLXkgSdUMnHstNx4aWfiFo8HUEMKBqjwLXWSOLJKR5/vYeeWt
         cgnKipfvtd6PiNxierJOqGMdSY/4OQzOs5ytXqPKveP171JrNAYoJ/fJMpI6/Dtn75SQ
         kHa4MS/qKSKMDNffq6tPWs2AWWzhWHbXDdR5n9faucIz+K9L6AeBHGAoJL4HaspaEsKY
         JNZwNS1wBfK8cbSBMmhbGMGUiw3nqccrKm3iSKXgF8pYC/npUd2dNlTwcCSSrN/KnQvX
         1yNkPhRgs0CeLvD7hKatMnz5zYpbl9Wxl9iEbMGwBX/pwpqGCmAMg8gVU+68mOp8fDyF
         9+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751127538; x=1751732338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LKIa1UkIqEHYKA4TXZ32HlvxWrAPwqU+G93P95AKhM=;
        b=vBMCz1hd8WfiuGFgZmKJKYot7SjwOr6k6Gej9gVl/sxnKgnndF9YRd+A81ggzOn95n
         AWHQaL4W0ac9aSrxRjkK0BuliiPJwWolLuR3LeAdHLatsgRQ+XITwMYWilr1OEAGsKHP
         aL0ieSnWzUU6TrpdbGEk/XmQV5srpQdsOli+Nahq8jsPOee67EYybJ2NMrkqjTgFEZT8
         QQL2jIsyCpLrRpKXVjga45wAoM4UQrsIL5rumePQheUW5AVCm5rypfF++kAJym6nKVj6
         6bOzZxV672ts8Tne3ZAE2a/vKAry0MbhsDfOneWHEMwG932sa1LqftmbqS4IY4hnFjY4
         6EAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBBCAUVQzigm1KitCyG/AkJTDh/IaEHiX6K4fFpB10Hvew0IIjKPfZTq5z4k0cutkks5ixcGZoV13j@vger.kernel.org, AJvYcCXDgtXm322MbSRGY+pXjspQAU7yRQpT43liQZ6kQhkMAVVVCO9G9j0Btpt2LDplSM3gRy6bNxdJTSSfWg==@vger.kernel.org, AJvYcCXrH5cv0IpS0veIgOCaJMlcGanXQR8bIMF9QYgw4KTg6WpdcSUyourSst/kg6ZvWSBD8IHR5npIw2CAHORE@vger.kernel.org
X-Gm-Message-State: AOJu0YyKZDBZqRsbhKRncs12kN+72CcWKqcevvwXvwk7OVr2uQH9jaAf
	8hY4DaeIKzTvFDm73KigyvtAcoLM73XBIl3OXx7F4YyOjJ7TKQzeNbokF2QyGsQc
X-Gm-Gg: ASbGncstNODg/c/L66kpjSrhDf0Emg0h4U/qGe/bs+nTiOxVeRJXX/sCZ1wn2D829Kb
	3daZvzcMwbvMiLNBN1pMyZ+SPfPlA+NDabxRZecU+kIeHEdORBRziy5+z/5EcZUUVRUH9h4odNF
	YaaBCUrfsHjbdRcHhZU5Du/22CguBTwT9uUNTFxxMr6fV21IaUYWJ1/wAARqZQbkT5lbRee6s5F
	vw3RK2uFagTUzWVuCYs3baJE8KAiFc3vjZjrzZfdRSQKAQdl2E06EA5rLWyHepnNDmgWX2EPz6O
	CZGfzFYF7oQHGP9k7LOYTk/B4HsfmbSXsqomUFZwkSzeIFgAtFobLf+1K1ZcJ5dKTV8V1HCdA/5
	I1NJRsDYfLYvhySebo3OtY3+FHZ6jnR8G
X-Google-Smtp-Source: AGHT+IFnFFs4/zkT06IDPwg/7N+bg2KatyMPdW5mr/p7CmoFo3YzGViLyS7g99n2jiNMjOpqUPKMVg==
X-Received: by 2002:a05:6214:4308:b0:6fd:76c2:a2fd with SMTP id 6a1803df08f44-700024399acmr145203516d6.4.1751127538199;
        Sat, 28 Jun 2025 09:18:58 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771dd8afsm38474476d6.54.2025.06.28.09.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:18:57 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: [PATCH 3/8] dt-bindings: vendor-prefixes: Add Princeton Technology Corp
Date: Sat, 28 Jun 2025 12:18:40 -0400
Message-ID: <20250628161850.38865-4-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250628161850.38865-1-jefflessard3@gmail.com>
References: <20250628161850.38865-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Assign vendor prefix "princeton", based on their domain name.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d02615496b..f03ab02afe 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1218,6 +1218,8 @@ patternProperties:
     description: Prime View International (PVI)
   "^primux,.*":
     description: Primux Trading, S.L.
+  "^princeton,.*":
+    description: Princeton Technology Corp.
   "^probox2,.*":
     description: PROBOX2 (by W2COMP Co., Ltd.)
   "^pri,.*":
-- 
2.43.0


