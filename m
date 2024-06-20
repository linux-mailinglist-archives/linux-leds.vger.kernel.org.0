Return-Path: <linux-leds+bounces-2066-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF0A910DA3
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 18:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E3A81C23D2D
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 16:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A131B29CC;
	Thu, 20 Jun 2024 16:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO4GBObt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2639C1B29C3;
	Thu, 20 Jun 2024 16:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718902431; cv=none; b=E7lyfzaQQai6Yop3fHH+WCiPO8IOf6Zp+yGtZFZqjWOdVP1SuMjT5mfC8kBRfV4vlzYhN3mjQ/I0HNEOYJV8f8EQU+tSXlj123fbU7MYhcLupHXeT1WcOB7MsuxXv4bII9cYCcmBubNL4qG/RiIpshOExx03hF3+bbcIeqIvan8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718902431; c=relaxed/simple;
	bh=xDu6nf8ci4QkjfA1n/XlGyTpBjij84y5HwadxfVXaVs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWC+Zl/wBmWnmXx3wHJ8JWt99cVowtrFE+D+cZfdm/C4IcCS1+MbvJuwKWjyg+/VROTlvgYaBbVc0rcX8vxNc3HYu1tQD1IhFVKA5gwIejX9luo/fH1w4ukRI99J0J/Ll7nZSbFz2A3xFbPzv35dkEcAe7eGcvm7eM6SXTGdKA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO4GBObt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-421f4d1c057so10993435e9.3;
        Thu, 20 Jun 2024 09:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718902428; x=1719507228; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z2+47l+SiK70HxZhNHp7aI9H3v+48mNDDXc2JjqLFDw=;
        b=cO4GBObtnQr92sMvhvNErl7Ek60B2qQkb54dVup2z40eg7BXrMkB+lhPC6hB7yOTzt
         C1sxpSUyvtmkIwjIKVa7h+3McX+AElS1Eq4tNBPrW3N3VQHcKIKPnvaTgHrKfchaLgtK
         igZ7/qQGr0/gTh9ZAuYAHq6w38oyTqNBhkX1gRGsXErHcAI4Quw5xhz7867t9CSbXCWe
         Pk3WK65Y27WKMCFCNmuu4XNrV3/FENAehXvl5AK3eYOoLIz4hzK7gjp6r2daGtYtvfIs
         wGStqhQ8uCIZAQoObMstBmut/XhNPir6Cz99yvXVOMInKan0rgpOkyErxrol4PwwfY7G
         Jx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718902428; x=1719507228;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2+47l+SiK70HxZhNHp7aI9H3v+48mNDDXc2JjqLFDw=;
        b=jRFZNdlObkmlFnAhJGHHW7PyGu9f21mOGt8QtC3fJjtHN6u8zykPZ/Dnx00uJ1Nizr
         rlc124hiXtx1R7CoXfTR9vscfq0yxuTCysxFrDtOyrjgK9CRmbhwg6e7CtqT11z0zJlU
         rrFdrgcGOxKC1Vh+7BovP2u/PfCTMJ6SnIA17jg+h+kNTfFCEz06bjtL0VQ1Ig3LA/uF
         iQcYuClJ9xxY0kTxTlhH9/B0Q4qjpyxiSHUKhHllfcpLCR01NvqSEfkO+X58PrfGK2Du
         tKr7jsnF92/McdCUD0yYL3DCXSazY7XiafMgL0N5MxcuBPf/sS6DDnZKt4hSWDdVp/QN
         X72Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTbbMGMZvB6FrWyKFuv0uljqhIQzRwZbhYpDlXqj60Mbj0WkSEwInqrCg/oFS9qPwy869BpZgDhYDC+vgwKIUN205x5EVntLzyJpoxzyPG9LnKPAvhA97ntI3KvlEBMEdXdSc3UU3L/m4BhC98UuLesw/2rELjnaK94Jes11IlopNJYL4=
X-Gm-Message-State: AOJu0YxfjrjDppeI7gnSX9OdlQSWKmMJDXuz6pejw69FG55ZFHJuCoOY
	kd7QzfAUgaKts2BhybXzdxsMYPTORRLP+2uQ34swV2YAEsLOuU9F
X-Google-Smtp-Source: AGHT+IEhQc/ylcurdd/6IEDOuPK9KgguMxvGLh2XA4wtboP+mlDcIBQRJO8SspzV77CcTZtx/U/d8Q==
X-Received: by 2002:a5d:4a90:0:b0:360:74c0:e546 with SMTP id ffacd0b85a97d-363175b806dmr4079573f8f.23.1718902428239;
        Thu, 20 Jun 2024 09:53:48 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3648e8c4e18sm2556956f8f.76.2024.06.20.09.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 09:53:47 -0700 (PDT)
Message-ID: <66745e9b.df0a0220.41e53.a3af@mx.google.com>
X-Google-Original-Message-ID: <ZnRRWFrixDYs_Ndk@Ansuel-XPS.>
Date: Thu, 20 Jun 2024 17:57:12 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/20] leds: leds-lp55xx: overhaul driver
References: <20240616215226.2112-1-ansuelsmth@gmail.com>
 <171890216265.1289520.18025885103780443097.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171890216265.1289520.18025885103780443097.b4-ty@kernel.org>

On Thu, Jun 20, 2024 at 05:49:22PM +0100, Lee Jones wrote:
> On Sun, 16 Jun 2024 23:51:59 +0200, Christian Marangi wrote:
> > This long series is (as requested) a big overhaul of the lp55xx based
> > LED driver.
> > 
> > As notice for these kind of LED chip there was the bad habit of copy
> > the old driver and just modify it enough to make it work with the new
> > model. Till v4 I was also doing the same by following the pattern and
> > the code format of previous driver.
> > 
> > [...]
> 
> Applied, thanks!

Mh? What happen? I'm preparing v7 with the changes requested :(

> 
> [01/20] dt-bindings: leds-lp55xx: limit pwr-sel property to ti,lp8501
>         commit: 08a9d2e79140ea1b40c107ea4c025bb8b71aa4b5
> [02/20] dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
>         commit: 75e28e4b32dda36c4a015cf2f9c4955d9024234a
> [03/20] leds: leds-lp55xx: generalize stop_all_engine OP
>         commit: e2176c637856cd206bf06b5bbba89b2cf45f7dca
> [04/20] leds: leds-lp55xx: generalize probe/remove functions
>         (no commit info)
> [05/20] leds: leds-lp55xx: generalize load_engine function
>         (no commit info)
> [06/20] leds: leds-lp55xx: generalize load_engine_and_select_page function
>         (no commit info)
> [07/20] leds: leds-lp55xx: generalize run_engine function
>         (no commit info)
> [08/20] leds: leds-lp55xx: generalize update_program_memory function
>         (no commit info)
> [09/20] leds: leds-lp55xx: generalize firmware_loaded function
>         (no commit info)
> [10/20] leds: leds-lp55xx: generalize led_brightness function
>         (no commit info)
> [11/20] leds: leds-lp55xx: generalize multicolor_brightness function
>         (no commit info)
> [12/20] leds: leds-lp55xx: generalize set_led_current function
>         (no commit info)
> [13/20] leds: leds-lp55xx: generalize turn_off_channels function
>         (no commit info)
> [14/20] leds: leds-lp55xx: generalize stop_engine function
>         (no commit info)
> [15/20] leds: leds-lp55xx: generalize sysfs engine_load and engine_mode
>         (no commit info)
> [16/20] leds: leds-lp55xx: generalize sysfs engine_leds
>         (no commit info)
> [17/20] leds: leds-lp55xx: generalize sysfs master_fader
>         (no commit info)
> [18/20] leds: leds-lp55xx: support ENGINE program up to 128 bytes
>         (no commit info)
> [19/20] leds: leds-lp55xx: drop deprecated defines
>         (no commit info)
> [20/20] leds: leds-lp5569: Add support for Texas Instruments LP5569
>         (no commit info)
> 
> --
> Lee Jones [李琼斯]
> 

-- 
	Ansuel

