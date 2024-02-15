Return-Path: <linux-leds+bounces-832-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B06856220
	for <lists+linux-leds@lfdr.de>; Thu, 15 Feb 2024 12:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30D871C21B23
	for <lists+linux-leds@lfdr.de>; Thu, 15 Feb 2024 11:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B2A12B154;
	Thu, 15 Feb 2024 11:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vKlbrH81"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BFE12AAD6
	for <linux-leds@vger.kernel.org>; Thu, 15 Feb 2024 11:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707997749; cv=none; b=Kt59H0c278rcbHaAYMUhSFf1yBpZScI563DkpizAiju4NHqQYuHqRVNuIBsRyAYX8OrnJpR+HLFH579WUw+gZL7E40BQcg28FeQkVVNVaB03D5aLuMqWl9aEgkA+hjRP1/xd4XIaPi38CZQVIDLaL8cQh4YxAXi4btVfrEdUJAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707997749; c=relaxed/simple;
	bh=PMdqF4BxnLzSwd0JYe63JOfvhqT8FaZryFeHRQWW11s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zbl9mG2BKpHaeR/qPizwnS74dFZTvcXx0cZBxy04Okoyb0mZBqolpbvsgiqOshy0fMwcWqqIZ1xeut+Pyt8FbLWGfu/baDg4B/XtI0Ie1AzZ27m8Y79H/++woR9iDdrdXtT8KvwL1+9oWjgrQBw4UZq5fFBG2/TsBjfxgAVBXaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vKlbrH81; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4122acb7e56so949335e9.2
        for <linux-leds@vger.kernel.org>; Thu, 15 Feb 2024 03:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707997745; x=1708602545; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PMdqF4BxnLzSwd0JYe63JOfvhqT8FaZryFeHRQWW11s=;
        b=vKlbrH81Q+fNYSZKaT93vsQazhllFw8PvlBaU03WUt0/++t49vHhlKe0JNGETVRW2s
         kpR7EZ8M+YM02cLkCmX87qdi/NqoewiErV7xTEOalX5BATkMLfrM0dEAZxv84Rq6JYNW
         JqPvkLSMR+re/+fyZT0LHags8GPH11gzWMPLz8UKwR/DG1MpTg7DItUfEaPQVEJR5U9a
         ihYZFgbAHaOyID1M1P1C+ahOICc1r2hTWtyFU4UxyN1vMPocW7vm374UjYtCOXwc4wab
         QQmFKHhUR1EJxyOOdakdtCLw66r6hysdLkxBne8cGhk4MuhUwL7o+lJY3PNlXBxmLqif
         D+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707997745; x=1708602545;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMdqF4BxnLzSwd0JYe63JOfvhqT8FaZryFeHRQWW11s=;
        b=wtENz29WSIMcoaJPxiMkCKtKKc9gbey8rFpp9WwB0MjXjhnhQobYGEPSarzBG7Vs6+
         Ir4XE3QT6ZYGlzqPZu7tob0TYS1/fNEgj+jcPicyiSMRBw+BNLRs3dJwg/5HRV0Pplp5
         U0JJhs01txgU8KK08uzOOjMKrkwb6U6S4q9FhFJ5BC1NYI2xp163jpcG/pVUNDcGI6YS
         otints0dBeQfq3J1Ij6URUF+0o+VCRXdQ/TQGsrDKiSSzAv7kLGtGoThBzeP7dgMDUBn
         gLsbeKFzn5J7sUwoXz431H/Zvzs7i6VGL60+P1mpcGg5xg+tGEOtRhUCgDLT5kqg2v0d
         O8qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbJZVLl/kows54HN8NJNJPcHx521UGerbFZJ0/zcqquVNCms1o+EMCOlc1Xxq8pqgNVfN1TuzW4vq+1ZJF2aebCRs8iwG/T9ZCVw==
X-Gm-Message-State: AOJu0YyBWW2USEH/nTeuolwe01utEmZSmZgI4tvXYwkytO4DyYmOm6Fk
	PHEUZGvz5pZ8ZafXWfqDTwnDqB2OQnKuS0PKNe9UgW03kWTPv4LTVlkGlbxlKoM=
X-Google-Smtp-Source: AGHT+IEPqfe0lQU32GGuFkM16RloqQWYNuLy7eiEqCzQNMdjhgJO3HI8g7e/KPfBuJeESwNfUgFUDQ==
X-Received: by 2002:a05:600c:470b:b0:40e:a32c:988d with SMTP id v11-20020a05600c470b00b0040ea32c988dmr1202419wmo.4.1707997745749;
        Thu, 15 Feb 2024 03:49:05 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id n15-20020a7bcbcf000000b0041076fc2a61sm4778156wmi.5.2024.02.15.03.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 03:49:05 -0800 (PST)
Date: Thu, 15 Feb 2024 11:49:03 +0000
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
Subject: Re: [PATCH 1/2] Revert "leds: Only descend into leds directory when
 CONFIG_NEW_LEDS is set"
Message-ID: <20240215114903.GF9758@aspen.lan>
References: <20240212-expresswire-deps-v1-0-685ad10cd693@skole.hr>
 <20240212-expresswire-deps-v1-1-685ad10cd693@skole.hr>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240212-expresswire-deps-v1-1-685ad10cd693@skole.hr>

On Mon, Feb 12, 2024 at 09:03:25PM +0100, Duje Mihanović wrote:
> This reverts commit b1ae40a5db6191c42e2e45d726407096f030ee08.
>
> The ExpressWire library introduced in 25ae5f5f4168 ("leds: Introduce
> ExpressWire library") does not depend on NEW_LEDS, but without this
> revert it would never get compiled if NEW_LEDS is not enabled. Revert
> this commit to allow the library to be compiled.
>
> Link: https://lore.kernel.org/2cacd8dc-6150-4aa2-af9e-830a202fb0a8@app.fastmail.com
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Interesting that this could be a revert!

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

