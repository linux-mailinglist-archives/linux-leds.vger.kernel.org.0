Return-Path: <linux-leds+bounces-1631-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED2B8BEDE1
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 22:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AC812885C2
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 20:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF8014B977;
	Tue,  7 May 2024 20:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lidICO5K"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DCF14B962;
	Tue,  7 May 2024 20:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715112505; cv=none; b=ZRB43cn0Pkl1bik85ivN/Q4nAVo1ZZaEthJt5Y+Cw5NgHWTx2EM0R1i+n7Hst/atIdyqGsojc5xfEgI6pdrjy2zR4T87jTyjLR9AcjKJ2BLL2K8xPt6/3zdvGubHgjzL37EnsG8FO8OeUgOVpvU3DltQt4BjrJDnZnGAtpX3dEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715112505; c=relaxed/simple;
	bh=m2RT8PC4x1UCnE8lG23iBCFVaGRGa4zOXUVtHgndTQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TjfnUXdCmVN9nfNcw6vyg4JChDBo+bTeHhFICa6fDfAZsWuOiImJdORdNWC1Ss7hHbu4tGhIirEXjtCjISbWKfkxQP0LZPZTUSp00NgelLrBIK6R/sfk1qVKLK0781qIFlpyr2aNhketK/ofUfn64LeHUchWmYrgPKBjI4/dPpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lidICO5K; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f4603237e0so98537b3a.0;
        Tue, 07 May 2024 13:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715112503; x=1715717303; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6meDpwIFn6POwM0GTM589VI6wgTQh6ljoPgnNTkMk6k=;
        b=lidICO5KmK6oZ13JRmAOHETckuejwuWUldFJckERavjx7zehVsxfpmGnOhq9jgfoeb
         1JvjZBIuuYHWXjItwju+jTkCO90bnM/m0OPam5nQ/icQ5xrTjFeCKOJUnPqnDn/FIXqX
         Rd64EOiprT6aLfYbfzTck1+Bw5PEIqKOXft2Dbbgd7hW5v7TUCg3VeE6f0d9ARYgEyiS
         gvRNGZBPaiITDnfGTGzvKxCrNOPWNtCQVflm6aVA7VOdOLmN/ooiu5dpt277v+Vute2i
         /LW7hh1tdaAbnDx5qF5ZZ6D9hDQWU3YHWH/BtbC88nzwOLFOmIkcUY9hUXSXZMVAqi4i
         Zqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715112503; x=1715717303;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6meDpwIFn6POwM0GTM589VI6wgTQh6ljoPgnNTkMk6k=;
        b=N3tDIAILsparCEwmcB/o7aJwjRrSQTEjItfbZ/g9o1BmMFnQLsCw6TaQ1IThsookUT
         GmD1ddF1nmhEKLTXhxex+h21jjqazTnh/DIxjJQk8F3OgwTut5fr24gULMAy896SIhTR
         P66jQjDLhY1gI1L1OJuW6d/1626s65Q7Yoz7x8PNOLMgP6+ca4FXDyFnaCORbLaJI7Dw
         rJV4t4fn5a0NTFrwyvmd6uQS2Gq9oh8k5VcYBLYtCgBsaxijGGxUP/EYUMF3jqk7up0s
         3juZ6hY8h0D42Z3lRhkX55cic97DkEfW3KkPWsZn/SNmTIh+nAhY1knvtX91xmQFecvY
         joTw==
X-Forwarded-Encrypted: i=1; AJvYcCUji+sxMgjEti80w77wpGnibIE/sZmAsfBvNGlSXjdqbpw5vPNu4ucOM8r3LE3P/TqH41XIkEEWait3mdpaPFTpn6JWEtkYi+DoNpBrwrp0dlQ8d+e4GfbMNthK1k94LfQ6CE653QgD
X-Gm-Message-State: AOJu0Yz+1L3/KyeY/6TPhZXblug97HC6Y3CX/cI7TQ/HyCj+v7OGx1Bu
	wYwkbLoGKGkuXTz4NADAhxbPDKvaEvi63+8mf7weV63RVFeP52wNw9seEI4W
X-Google-Smtp-Source: AGHT+IFZwUjrLsg8NOeqZqvTwtxZQH+cAZNq93P6AoVgP0/DMGlcVNZAxah6QwTxMcsDtMHT4ATRkw==
X-Received: by 2002:a05:6a00:2e1f:b0:6ed:de70:5ef9 with SMTP id d2e1a72fcca58-6f49bc48a4bmr1167605b3a.0.1715112502697;
        Tue, 07 May 2024 13:08:22 -0700 (PDT)
Received: from localhost ([202.88.220.221])
        by smtp.gmail.com with ESMTPSA id y6-20020a056a00190600b006eab9ef5d4esm9823201pfi.50.2024.05.07.13.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 13:08:22 -0700 (PDT)
Date: Wed, 8 May 2024 01:37:11 +0530
From: Aryabhatta Dey <aryabhattadey35@gmail.com>
To: linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: pavel@ucw.cz, lee@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com
Subject: [PATCH] docs: leds: fix typo in Documentation/leds/leds-blinkm.rst
Message-ID: <qpnx2m6qo5abvbs65o452gicumxa7n5vnw42e3hxnnm7sou4xn@fvu52tilzujc>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change 'dasy-chain' to 'daisy-chain'.

Signed-off-by: Aryabhatta Dey <aryabhattadey35@gmail.com>
---
 Documentation/leds/leds-blinkm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/leds/leds-blinkm.rst b/Documentation/leds/leds-blinkm.rst
index c74b5bc877b1..2d3c226a371a 100644
--- a/Documentation/leds/leds-blinkm.rst
+++ b/Documentation/leds/leds-blinkm.rst
@@ -7,7 +7,7 @@ The leds-blinkm driver supports the devices of the BlinkM family.
 They are RGB-LED modules driven by a (AT)tiny microcontroller and
 communicate through I2C. The default address of these modules is
 0x09 but this can be changed through a command. By this you could
-dasy-chain up to 127 BlinkMs on an I2C bus.
+daisy-chain up to 127 BlinkMs on an I2C bus.
 
 The device accepts RGB and HSB color values through separate commands.
 Also you can store blinking sequences as "scripts" in
-- 
2.44.0


