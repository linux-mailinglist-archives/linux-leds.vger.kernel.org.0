Return-Path: <linux-leds+bounces-4484-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 475F9A898F7
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 11:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E62817F14D
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 09:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690BA28BAAE;
	Tue, 15 Apr 2025 09:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIwkF4FW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25E928B4F1;
	Tue, 15 Apr 2025 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710994; cv=none; b=aIhsiqhbM9PItXnqS+w6Mx8gwDtTKkGcf9Uk58xz21V6NYHV1MZthAJzgG7QTQyGs9XPxTi8DwdXectgwGH52nPveRFEAvK+WKsEFuHKGVM/3aHO5ouaJW1PJYXJtz/X+8OaS15gQ39T/p+SLGL8S2VOG5+0Wv32/FQDMukMq+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710994; c=relaxed/simple;
	bh=zexSfGF/hZ/8AIoMKghvNwSydHnZfbFtGkCUys09DYw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KfTfG7EL7ML6ue1P9CAMbHZ1GhYaLrJGCRD+cS8j55DFBPSjF/kvyf3auUQwCKoQCdWwBjaQSqkdCkQVHymqJkzPZNlZMHM8E3yK1r8y427O0zeKkz2lfqtngaXkCeORNr4v+qa0b1ogv3M6JjWxD1JhrN8b1gfUYhWPxQyx69Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIwkF4FW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30384072398so4757813a91.0;
        Tue, 15 Apr 2025 02:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744710992; x=1745315792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jYOl+e48RHYcQrG4+rIw5B0RujAReV4wdPNmp/H9/0=;
        b=kIwkF4FWDT/OvlAg0B1cHkv6Vfl4K7Flml0QUp5pELxKyWu/48VzFn9GccVsEqlGSc
         ih4lpVwtMMzp+6TT2jFsliOLhvN2FFgWN2cXxJ+GBlggqGsc2W6OMqGvoTX4nxOHqKBl
         KJZFNoPXMREwbCjCm9c73fX0llwgWG6zvSGkyFNQouRKlqs7HRLQgBbLeFDC5MPlytGl
         X28e7CaGXIZIJUPDuoo+dxza2mtQOJGMjZYKwX/0roWJWAGUyMyQ8lKvr9H9c2R8CUGT
         /4iYqRss0F1ukEFthqotplC0VXtoK+/SSgzcnQxxPQc8fkjmX9poMC+EnaS8o5cV3ku7
         98gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710992; x=1745315792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jYOl+e48RHYcQrG4+rIw5B0RujAReV4wdPNmp/H9/0=;
        b=jkdLuhIZaM2fSbx9Q4T4dnBFwmRqKm/pKLmyzUbIbB45YAFAolqbyhS4xteNGoiswU
         pL0BpY+hwHMTlyqPd8wgtWiM7wjU3ejGoD/ghIg/JobMqHTcVLxEceGWKwYWm2JrW0LH
         +VqC9qbvehpDnES++VhWBKaVB6HZSSh0KM13I/T8zQwU3ZZuN2CYZSH/S26gDtWShaCc
         /7h+OiGTonQ5DdbgliGK+ecH7m2PjIv4YZtbzU/n971UFpryxtauOb8yaB1GABemXR/f
         ZeQLMwuUagOz/kOzK4Jger6gpi3qjkFzytg9/mpuMeJwp65Z5/UZdW5NCyj5W+C9PHwO
         Tm1g==
X-Forwarded-Encrypted: i=1; AJvYcCUQVJW32hg58BlzqxDtcvJCsrWo9n1dIotm7F/XyEcpMUbD+A/J1+GNUvvTFz+bTSUSBqUGBtzoaZErvA==@vger.kernel.org, AJvYcCUtKOdyCbTCglC9CgfaNnWxIv2VQiVqyR7sb2tEfMSLhe7XMUxvRepTHF/bWrMSJWZUKUSh0cPVWoNsOjF0@vger.kernel.org, AJvYcCXooWTMixHoRzSJf7oZr1elNgrsGLwrjW9Ahn+vStq2w/G/Br5uB2ZjVcRxx5xaT3dzGMqfPrlMa+sl@vger.kernel.org
X-Gm-Message-State: AOJu0YweokMi0sFOKKBAZKmlmdtJc0p2Ynlx/YaDBt9gVE9pThe3cMIb
	sJvNaVc0Vr/epdLkdHXSp2tnD1JLtVhQAj0Sd2rUU75VLZWdP7uD
X-Gm-Gg: ASbGncsg93BI5O7QeU0nCkN0O2pH0J3s7K9wPhyj+3QSjKBi8KxlUpmOqD7Au7FqUEt
	EBbKhegG47ADKPhtxXcquMurimrE7t+sGcA0VViurPB1rEgxQ1/SSbg1MaaEzlX9oNNbzEvQrcJ
	EFsLRjYQ77jE8TJCY3pE13smUmaw918IEfY8kcQtIY7QgwOUerS29k89IgqY5Mrod4hm3s3i0Zn
	YNJC9CjSDeR0nm6Q8Xaqj3rSiuZSnAn1/OmzllSKJ2t1asvDANl7HAu2HDjw9RkVuREDnSoffuZ
	jfHoewVQgTFwrPY2YSXzsPAOWtl/FkNhWHE4V8rraTrt6loo6KMF/EM=
X-Google-Smtp-Source: AGHT+IGm+bI7J2BAiLTWgyyBanXYuxf3KQgBZkGMSTMoP/XRp7sbFqPBAo3izpZAhlK9Jv46apiJZQ==
X-Received: by 2002:a17:90b:224c:b0:2fe:8902:9ecd with SMTP id 98e67ed59e1d1-30823675d12mr20474980a91.1.1744710991907;
        Tue, 15 Apr 2025 02:56:31 -0700 (PDT)
Received: from localhost.localdomain ([116.106.96.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd10c3dasm12843617a91.4.2025.04.15.02.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:56:31 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: krzk+dt@kernel.org
Cc: pavel@kernel.org,
	lee@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: Add LP5812 LED node for Raspberry Pi 4 Model B
Date: Tue, 15 Apr 2025 16:56:05 +0700
Message-Id: <20250415095605.8607-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6e054aad-8e2d-46d9-a45b-e334f7826f5d@kernel.org>
References: <6e054aad-8e2d-46d9-a45b-e334f7826f5d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 14 Apr 2025, Krzysztof Kozlowski wrote:

> On 14/04/2025 16:57, Nam Tran wrote:
> > Add the LP5812 LED driver node to the Device Tree for Raspberry Pi 4 B.
> > This enables the LED connected to the LP5812 to be controlled via I2C.
> > 
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > ---
> >  .../arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 60 +++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> > index 353bb50ce542..0dec6ce44c6c 100644
> > --- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> > +++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> > @@ -152,6 +152,66 @@ &hdmi1 {
> >  	status = "okay";
> >  };
> >  
> > +&i2c1 {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		led-controller@1b {
> > +				compatible = "ti,lp5812";
> > +				reg = <0x1b>;
> 
> Messed indentation... You already got such comment about your DTS in the
> binding. :/

Thank you for pointing it out. I fixed the indentation in the binding file but overlooked it here.
I'll make sure it's corrected in the next version.

Best regards,
Nam Tran

