Return-Path: <linux-leds+bounces-6388-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 410BBCB04EC
	for <lists+linux-leds@lfdr.de>; Tue, 09 Dec 2025 15:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D94CB303EF44
	for <lists+linux-leds@lfdr.de>; Tue,  9 Dec 2025 14:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1872EA177;
	Tue,  9 Dec 2025 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uwDLjaam"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AE82FE061
	for <linux-leds@vger.kernel.org>; Tue,  9 Dec 2025 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765291295; cv=none; b=Dvp4ANw++UQlNwI9GO+9PkDE+CI5sOOTvDvmek6e3Nemglw9M9t7EsPbQ4B1LgCFNiyPjwn0odiRmQilYOQa+kZ+hdHkPeiec7aYo3pib4McIw9SQn5SAdemClQleLKDU/IAwfjM2tL73cfB3tieJq47ysnUUOp3080GfagYoRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765291295; c=relaxed/simple;
	bh=rLipDWHp/1XqeYQ/MbPAtnNwpSFTzKkZ5pd6/sTziaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvOeRZzG07fXjByeb8FV0vRtqnUYf5aQW/F2zy1Ft89gB2rytGAoHO9uVmWlkL8dALHASS7PVcZRhMW4hxyyE1wSMTeTyEOjUw8t6C6A4b/fJo/10LX9Gvhglq+iNxEvxUrUwWLi4dleg4zHkuUrqyHQdZFJEm7Xw9JJFMHaB5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uwDLjaam; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42e2ce8681eso3902324f8f.0
        for <linux-leds@vger.kernel.org>; Tue, 09 Dec 2025 06:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765291291; x=1765896091; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tV7fC4Q3GnUl3jRisPYENdBV/quWBBgj8sbTSTRlyOk=;
        b=uwDLjaamc07QNh/a86lMjEysHUCCRVpOSJz10SDoJ4FIKfX/gXVUdt+cL5Sday9t0I
         xEGipdWOf5BJwwG0qJoTzvuOorHfZE4MZ1ZhYw6Snxv2D4Nx6n2dTa5SWLePkbaD1yYe
         YwiU3uyooNw95NSi76fPzYxS9MM1T48qvszC1rS1oFHXUaJGQUONOE6guL3Gtr9w4hua
         SSP1vFip/0LlT/mDOFfIL/iWL7M/Ng3FNq6HU20wjjDB26m2df1R0Kgg2/iOaUpnAQK1
         S8+SYjjLXcyz6rd7OyNN5FTOyuRwHsOIjyXCgf5XG9JJyqLoamFBjy7MFfMeGTt8Fsny
         QdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765291291; x=1765896091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tV7fC4Q3GnUl3jRisPYENdBV/quWBBgj8sbTSTRlyOk=;
        b=BjRQOXWi5txdCbbR+KtqCvIoHnIaUMlOxZGQ5ulgTwuaC8PVMIRVNMXuriVojGJOFJ
         wy/VE0rwRBzmPQ0pEYTdQZEtW5QmjyUTB5C/w9r21mvCLAc9UfS7+YJjA6RToR67RsF4
         Fj/+mDIOdOMnwlF68YIobFnTsaHTO8jbE+hp+PAkuWYrVaUJ2Qg7s3Ze8FTpGXLBPtHl
         s6rjwePhCilo2aecJxvy6IqYPm7vw50a+hM8IpPK4w3ASozqfoU2x62v8C1ibuppEjgO
         U6E9tKTzLXiow9TMeQuWpuJXjMbrkKz9GUVj3Z+7Kt6Jd7FKa8ZYLApvMsJSQwCnKkMe
         06Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXB2XSZzDmmLUh+gWQiQ9oy2taVl+ZYWJGf6DSfF1GGwbos+ZigoRRt/kC+0lEbUQiA0QHf5aekmgtf@vger.kernel.org
X-Gm-Message-State: AOJu0YwdbrKG0xa+R/pjiFM7ayAfZeXu9zzeg/XPt1fsYgS5Sa9KJmPJ
	MlBHHhejTj7bFKnWagZcauUfffnRwMCl0GugZQOHi2V4TaNf04M5zKfeXaIwdGqNnY0=
X-Gm-Gg: AY/fxX5mjW58Yp4n9ZeEWUY35qd6ixHqYZjlzsf+2NxGXG2kxTWtqsi4UGlj0fI6sNv
	iAhLk2zIWxgPOOh/0BM3GtHRTaMeXbpbEzz9q3L2Eg/U4mfGBO/UmKvP8NDDeVT5OtkCvckkwDn
	RHJqRjjsaZ60fTZZwC0eOhuZz5fZSu9QPI+6oPFs/s5wr8Zd1pzB7ctSdpQqHuSliBTNjImnACi
	tJdfAJLKYXWMdkf1yxCTlAKiMQdFTelSKJgu7mxYuhqtSKc516HlbVES0PPhNiegH+0tHnQEXiI
	l6WEvXuDYi9x5pTBNbHx2o3/jS4KAclCKXURfTE6D1YKNXrWeLgXdW9qh+raWxKSxSWpbKUCs0f
	DVsMkkH95DYm8thHJPXWX3Yrb12fBoHXnemHruHI1JAqMUKQcqSLKDI5n5nzl8IOLT/CodaYB7P
	IIO3pYAvRWx3QVOBMj
X-Google-Smtp-Source: AGHT+IFNmhiLCQWwj1z9cR6s7v/7qEeyW/OZMxAhr3E7hvdIj5qnKl1ZekpnOu4e977AVVxvtEYp1Q==
X-Received: by 2002:a05:6000:208a:b0:42b:4858:752 with SMTP id ffacd0b85a97d-42f89f0fb5fmr13180134f8f.27.1765291291413;
        Tue, 09 Dec 2025 06:41:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfee5bsm31889015f8f.16.2025.12.09.06.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 06:41:31 -0800 (PST)
Date: Tue, 9 Dec 2025 17:41:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kate Hsuan <hpa@redhat.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: rgb: leds-ktd202x: Fix error code in
 ktd202x_setup_led_rgb()
Message-ID: <aTg1F1MH5qnmUkaG@stanley.mountain>
References: <aTfIHE_2-iKIrwqv@stanley.mountain>
 <CAHp75VdHEVsj9o1UPSS1ikJYofDuiA7KwUaj8v79cJ3Xs=N5xw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdHEVsj9o1UPSS1ikJYofDuiA7KwUaj8v79cJ3Xs=N5xw@mail.gmail.com>

On Tue, Dec 09, 2025 at 04:14:03PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 9, 2025 at 8:56 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Return -EINVAL if the "reg" value is invalid.  This is unlikely to
> > happen in real life because it comes from the firmware, whether from
> > device tree or ACPI.
> 
> ...
> 
> >                 if (ret != 0 || reg >= chip->num_leds) {
> >                         dev_err(chip->dev, "invalid 'reg' of %pfw\n", child);
> >                         fwnode_handle_put(child);
> > -                       return ret;
> > +                       return ret ?: -EINVAL;
> >                 }
> 
> I think the better fix is to split the original conditional to two.
> 
> And make the message something like
> "can't retrieve 'reg' property of %pfw\n'
> for the case if (ret).
> 

These are never going to show up for users, the messages are only for
developers bringing up a board...

regards,
dan carpenter

