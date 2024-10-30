Return-Path: <linux-leds+bounces-3213-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F8C9B6FB1
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2024 23:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD816B21E73
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2024 22:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778871BD9E2;
	Wed, 30 Oct 2024 22:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="1FOUuXsc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C5F1E2007
	for <linux-leds@vger.kernel.org>; Wed, 30 Oct 2024 22:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730326173; cv=none; b=mQPzHbtEUe8EyxwrBqlKfkgJg14vmvHfugh96DQGbhnGDNArDxM+D+7WnpX26YW6kAVBpwfn+A2IU9xVX1dIBnDVQsXrSYHCBa1OyGJ2LSWxICFMWdEDAdaiMptfw0cHDP0QZeicZqVFp6OFVoHt+F8FDDoku4/89Q3IdFLpEEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730326173; c=relaxed/simple;
	bh=Ltt+XpbOguZtHhRaLk0cqD3UhmeBc7tolLZVy38OA/M=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAZKWXv6eze5mXwZbb1e4PxYYdhA450rRVS34J/LNfDwQkGE7KXsgEEdgjpvhnKIfH6O68npJtBM3moT5P4LBHzWYJufDzeocwALuCFeGTnFS41nBOhCQO6MCoNaSmSv3nGvvNmsLJp5P2ROMY4F9HQWtXyj1okmZHAgeUAHyXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=1FOUuXsc; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a68480164so37592766b.3
        for <linux-leds@vger.kernel.org>; Wed, 30 Oct 2024 15:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1730326169; x=1730930969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6+DBVSPzDCfzgckI9Hf2ncvKjBb1Zed+3V8RCmYtGgI=;
        b=1FOUuXscxDTDgW32c6HAh0EAyBSgIEcdvMPpthkd6dM8Ow0CueGZ84VtxryvpU+UNz
         VyttD6wJiEfuHxj+wF5G+AlTzQ0JRP41plQyr/GezTMYKhSlWVTNLCiPGsZ2P5FkpcqV
         AuAv+9IJDDNiLe55NezH+8oc6qBuTSc3VVOdscLgfkv+XY5utTSJkPpbKTvCWFW3PPK1
         rFtWT83QB8QlH0kOuEhRdgZBN5+wsmylOv+NWWUlbk8TGuzUaviEyMr2UQkYEXLolWfj
         spqZDHtW+YWMnTh/K7M/u6yjB14RANLyoyh1eJ5/bqXG0EQm6GE9TLMeHU7vt1OsXgKc
         01cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730326169; x=1730930969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+DBVSPzDCfzgckI9Hf2ncvKjBb1Zed+3V8RCmYtGgI=;
        b=PVJDtElN//VGTFF5M64aDNYrNV6nMc8Y+2Wo/47VuxbeH3eRBmxqdQRF0cILilXcNa
         VgTDe68SriZjMBHKx/PRKGyhUTZxo860F4zf//FxdmulxQMMrOqb1BcAmi5bAX1rzVJ9
         y1P+gQLMHwlPcXIKMhezxpwQ23Acg+RCaaQVPBpuYyjCf4EyP23bSLsQ62AZBOmw3UAG
         uZpsLWUzH72MNCNKZMtGOtGy3fzXfduRyqTm/S5jgDPsTEwJzZ6IC0DQLQCM+E0SznMn
         usMLXklOSk3Py4Rit4azJf9j5PgHGxI9/3ywffm+B7vnDzgqDYAT4hcVkjdH1jhuvROf
         JmHw==
X-Forwarded-Encrypted: i=1; AJvYcCXTuCq/xwF0DUczfNMrqCMqmOZylTuSBmFgZpDYV4htj6XowZy/EVzA7SRKK2R41IMMgmxCYeypAelT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2+7446dVX4smCAKhRy+I9/jEOleuetxZ7g1V6xI0b8k5hIF0n
	FHqtbuH+RtyrFerRsR9FC5CUBiFmMXHSmrFqQdBNYVLO7b5OwkBQhSzmXDLoPoA6gleDct/gla7
	AWOIqqJTASyKa+SFrFEjfDHXCqL9Hfri811WU1FSmd0FpAJr/nvPLMm7iclqdsMRZq7DyS+I5Rm
	jVC0HWkdqG1ZlZSq8RtvNZH3Xo
X-Google-Smtp-Source: AGHT+IFNLkuBk0iSxb8AnXq6Mo/o2HQPCizOUnh7XgQgMnbveMrAhTQAkzEgMArbjMWP4Pvn4l3BNw==
X-Received: by 2002:a17:907:3f9d:b0:a9a:1160:993 with SMTP id a640c23a62f3a-a9de5c91c9dmr1827906666b.8.1730326169278;
        Wed, 30 Oct 2024 15:09:29 -0700 (PDT)
Received: from admins-Air ([2a02:810d:aec0:2a54:78f0:a911:7b11:40a4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56698e06sm2683366b.225.2024.10.30.15.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 15:09:28 -0700 (PDT)
Date: Wed, 30 Oct 2024 23:09:25 +0100
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: rdunlap@infradead.org, pavel@ucw.cz, lee@kernel.org, corbet@lwn.net,
	linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] Documentation:leds: Add leds-st1202.rst
Message-ID: <ZyKulcUCW3kk1AYX@admins-Air>
References: <Zx0BKtXo55D_pCGk@admins-Air>
 <0ae13ad4-342a-48ca-bd7a-8f15f6d99504@infradead.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ae13ad4-342a-48ca-bd7a-8f15f6d99504@infradead.org>

Hi Randy,
Thanks for the review. Addressed all comments.

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---

Changes in v2: Implement review comments

 Documentation/leds/leds-st1202.rst | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/leds/leds-st1202.rst

diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
new file mode 100644
index 000000000000..72286a512c69
--- /dev/null
+++ b/Documentation/leds/leds-st1202.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+Kernel driver for STMicroelectronics LED1202
+============================================
+
+/sys/class/leds/<led>/hw_pattern
+--------------------------------
+
+Specify a hardware pattern for the ST1202 LED. The LED
+controller implements 12 low-side current generators
+with independent dimming control. Internal volatile memory
+allows the user to store up to 8 different patterns.
+Each pattern is a particular output configuration in terms
+of PWM duty-cycle and duration (ms).
+
+To be compatible with the hardware pattern
+format, maximum 8 tuples of brightness (PWM) and duration must
+be written to hw_pattern.
+
+- Min pattern duration: 22 ms
+- Max pattern duration: 5660 ms
+
+The format of the hardware pattern values should be:
+"brightness duration brightness duration ..."
+
+/sys/class/leds/<led>/repeat
+----------------------------
+
+Specify a pattern repeat number, which is common for all channels.
+Default is 1; negative numbers and 0 are invalid.
+
+This file will always return the originally written repeat number.
+
+When the 255 value is written to it, all patterns will repeat
+indefinitely.
-- 
2.39.3 (Apple Git-145)



