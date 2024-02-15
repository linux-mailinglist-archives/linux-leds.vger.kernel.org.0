Return-Path: <linux-leds+bounces-830-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6536856212
	for <lists+linux-leds@lfdr.de>; Thu, 15 Feb 2024 12:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 422E61F22630
	for <lists+linux-leds@lfdr.de>; Thu, 15 Feb 2024 11:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7614612AAD6;
	Thu, 15 Feb 2024 11:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gny9/BCp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FC512A14D
	for <linux-leds@vger.kernel.org>; Thu, 15 Feb 2024 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707997717; cv=none; b=fPZOPQo/HXZWnN6KccYo/b9oIgSkCvqN3df3SIRCwJGhQOIuY63CUYaEYQ1U4d5XbZHVFTguR2JtK6cfYCWwt8BiCO42v2dhNG8RAgiVTgZgSa5lcjxDgTK6TYcI+mMZZ/avMXrpCgpfMJpwhEpiimQkC1GwXQiFlmFm/YxpWPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707997717; c=relaxed/simple;
	bh=FaR+rwTP87J6jI3GhtgMXyL1UpaYTYZi7hZBMtfoOLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIow4WmhTQnset7Kk07CkuwIYoM6HbbB/MuIqNhLL/zqr+jwOrLvwwiULrfKNskLy5ZMgrlixu5KHvULHMwMARS7x/3n3JDrSrXAL2isHEkHGo/iA2YkUbqefNEa+A9OpitOBlHb6JOQiUyhEhlrHpt8XQmKOlzs64gHhOB9CwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gny9/BCp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41211acfcfcso4955295e9.1
        for <linux-leds@vger.kernel.org>; Thu, 15 Feb 2024 03:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707997714; x=1708602514; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DroRDiixIta52dRC0kBdYzbBsXfxkiN1Si4pySYG4VM=;
        b=Gny9/BCp7iqVOJLUyqZ0dxeN+cd4IZKyOobTfX6l/tL5oSnMN9vq8fsJKsousx9Rui
         QFsOtZnJDsRtQ1IPmENihjPXfF7msEtcwwG/iMM65yfQ8PzjPG6TUqIW5SMIuHncxH7g
         mdy9hYKroAQ9jP6kDZEtXX3238awHWQIHLqQuBFiXf3UcZRdY4vpVpQcOR/iM5xRtcFg
         CuiBiTy2QAtCs/XCmtt5oIy4lulJQZ4SBCvQS3uwN3PRjFNuliKSg8eZeFaliKa+mrmR
         Zm89HBwl/Gyycs7E95vCTg5VHyNx+d1KF/YaxjgHM6LYJK6fzePUm9mw9e3MsmD8X0S5
         Nl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707997714; x=1708602514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DroRDiixIta52dRC0kBdYzbBsXfxkiN1Si4pySYG4VM=;
        b=COMvR2c1hTT0lAp7q5nyzSGRZ6ZcusvDisjemCQ93n/t9rHKdo1RL8kBc7I8/E0S6O
         jOgjgJDafyiqfHqR7WLeHJJuspudOPIkHTeSmDiUD9iXKMr8UNv90u7nwX5RRQgS3iGU
         8NKgoQH6u7xD6RA5pr/v49+nfQ8wP7nOKppMbJO8waFrXnuj0v7BhOxchcQ2v/j7yUDz
         4V7nP58hu8LPlyirwvWjg/QgY04e3Bu5c22B91tLVuumWKULj9yU0Ruzg6UEveAcxtaD
         iBct9Ku+xf2ztZpp1TFx+NjoqO0yxTSfJ+guebJ7MCqV+1sTFDL3WsQqL+NhkEsPbk7B
         udJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPAuZMfpY/6ebGGoGE+ojhhv/9JXExDAU0eWY9XiUdmrKN0qepliEMD2GQGwMqN/6N7eFMZcnwqmTmTtpxFmm3/MgJHSktxrLeOQ==
X-Gm-Message-State: AOJu0YwlKTSOcQF34AY1eh18HIwdVQHlLFNZ9xPJZiT1Add1YQ2+Zcvv
	LMnYjUMavJzbZGL0DZ1qMx9Plf5x2TLdagmNcVDiPmx2W7pOt74yv2V2iDJzIkQ=
X-Google-Smtp-Source: AGHT+IGOdMVWbwspHZiG2UkONtI3ot5v2Yf7yd80zwMxWdUapC4d2kyA5ljlBgnTJ25oK0jtN78zUA==
X-Received: by 2002:a05:600c:45c6:b0:412:1500:beaa with SMTP id s6-20020a05600c45c600b004121500beaamr1042184wmo.40.1707997713895;
        Thu, 15 Feb 2024 03:48:33 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id t4-20020a5d5344000000b0033ce214a97csm1543569wrv.17.2024.02.15.03.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 03:48:33 -0800 (PST)
Date: Thu, 15 Feb 2024 11:48:31 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Flavio Suligoi <f.suligoi@asem.it>,
	Hans de Goede <hdegoede@redhat.com>,
	Jianhua Lu <lujianhua000@gmail.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Helge Deller <deller@gmx.de>, Jingoo Han <jingoohan1@gmail.com>,
	Karel Balej <balejk@matfyz.cz>, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: expresswire: don't depend on NEW_LEDS
Message-ID: <20240215114831.GE9758@aspen.lan>
References: <20240212-expresswire-deps-v1-0-685ad10cd693@skole.hr>
 <20240212-expresswire-deps-v1-2-685ad10cd693@skole.hr>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240212-expresswire-deps-v1-2-685ad10cd693@skole.hr>

On Mon, Feb 12, 2024 at 09:03:26PM +0100, Duje Mihanović wrote:
> The ExpressWire library does not depend on NEW_LEDS and selecting it
> from a subsystem other than LEDs may cause Kconfig warnings:
>
> WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
>   Depends on [n]: NEW_LEDS [=n] && GPIOLIB [=y]
>   Selected by [y]:
>   - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]
>
> Move it out of the "if NEW_LEDS" block to allow selection from other
> subsystems (in particular backlight) without raising this warning.
>
> Link: https://lore.kernel.org/20240212111819.936815-1-arnd@kernel.org
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Fixes: 25ae5f5f4168 ("leds: Introduce ExpressWire library")
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

