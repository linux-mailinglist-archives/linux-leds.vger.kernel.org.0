Return-Path: <linux-leds+bounces-6387-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FADCB0393
	for <lists+linux-leds@lfdr.de>; Tue, 09 Dec 2025 15:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12897300E3EE
	for <lists+linux-leds@lfdr.de>; Tue,  9 Dec 2025 14:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F9C2868B4;
	Tue,  9 Dec 2025 14:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJrzUsLW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D3927C162
	for <linux-leds@vger.kernel.org>; Tue,  9 Dec 2025 14:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765289683; cv=none; b=uOPltyf/dE6fulvRW7DppNDwIr6sm18ZEwOCimF9340QZFplSZPjVCoNqEn52WRui+3JRvV4o50drH9ZVZ7aUPnp9jyMykMZzaTaKJ4wJqKKKjG1uby/MCRxWO8GnSHhl9N9i8wfpc0bTRUewdeH6eIeOh5tN4lG+11/awByMcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765289683; c=relaxed/simple;
	bh=p+MnXMxY2ieuINKDW+qcU42qclFHOt/7ycs9gddmvKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Drx+O0rbT8P2AzzgcyFgxHncz47825pQiSsIWpiYP4y6opw5/nNr7EGU3HwOR8I+uOTosGs4HR1/WRAtluFQciS53bA9FOfQffJxRF7qD4Zf+XS/4nWSl3KBngZhmpg/CYsyGtbKfpi5qTh6YCwMx6IcWcYQD57W9RFVErWN+mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJrzUsLW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b72bf7e703fso964897166b.2
        for <linux-leds@vger.kernel.org>; Tue, 09 Dec 2025 06:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289680; x=1765894480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmfJkbH7xP/snHtbfubSpeIYpZRSL8H97Un9pUNUfhg=;
        b=nJrzUsLWcWVtPph2cTv2gAxxL3vJpcVU2HosFhlnRRmcojvudV5pdPvg696LPN7lGj
         y4kMnRC5xYXbHf9fqDBHE9wjyFULunpHMLxMnwjiBpeg10TUhPdqj2Dd1uX+zZM5f/nb
         U27R6Zh/3/BBK6MyldQoadI8DeFF7LGDVhu+fOGq8K2l17U6qYgVnKMVxulUOVw9Q3yY
         uQeXJRAWL9+PkzGDDqCtRyppGCUMRahQPJx1FJRLUkPqOiqDCzOd/bNz4V3StsYy9mDr
         aodVT1V/7NuQ8nyMwsl8xVH1g/58ylAyycgKKO9MIOPCcPQ9Om9Ne69uv/izsS1n7qxW
         ZkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289680; x=1765894480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmfJkbH7xP/snHtbfubSpeIYpZRSL8H97Un9pUNUfhg=;
        b=jKQCy7aoLpYFqeDMQJfwejPdWGR2X+Us15CXrjaGSXRtzQp7TDqgmBBx0YoJVDgLpN
         VegKa1CfOR2tYt0zd3PxWdTY7HAujXPyt058Q4LNN1uNdrjC3H0i1SJNWPs2hAbUQX6S
         R4+iasIEnZW6coMzxusDFZXXU0t93ZJTDgTzY2THJGZYZfMjlDU61Fl0wJmZWTb2m+ZJ
         lvtZlRGStZfwTOPVR5VrQN2h06y/M+zUr39MFlpNjZEWbyZ+2Byy2zWPzEz+uIG1Yudt
         9kXZwqlwMWGLWhxQGlSgAwl4uswKQGdrwDs2FIrLxz6NVneD8uA9wM/syOO4LlensKQM
         krGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAK9Gu/XfvHGaLjT3GEdEuWxVBKmmdYwR94/FJ9dXSzv7/X9gmx678rkE80Ceog1kT9s0r+9qPxHuT@vger.kernel.org
X-Gm-Message-State: AOJu0YwiW6+tI0TPI4es4jS5XIP2SCfxmrTT9smdS9iboSshYPd+W3K1
	HBNQhgw/Tw78mcsLPMmATB/N6RhG5q4S+75jKXo7oyU25NudAPI/AaZwOcBG/ZsyDsz/Ks/EaS5
	0awS6lJ5AFr8xVz1LQ2ycfL7dp8FD2+c=
X-Gm-Gg: ASbGncsef/7hrLbB3uRcB2wP2KdATnWBwyBTEkaeAYIE6G3rsaxV+DnWn+xieKHLOtt
	1eOGq02ixb2G2JX+I4s1X5fG1yFXBvy6zZyCkS8rt648Tn3i7+YmdJ5zzzq9WOM5e41VFNfzSQK
	7m5qfJ1zh/BthTvRip6knYASqOiJ7AqgcTgMoP+GEjaIac7VjYARg7va7nJ2yQI97f8i5uOqWjQ
	HP1JTbZetR7Fse3NErGtYRxlcXopdUaPZH6RTFmv7HRKo0j5mKs+I0l/6Die0FdsA2pNodxqQe+
	C/pkuplckUcFHnwXzJmtb5Ux56vxAnv3vym12mnA0kUOFsZFnh/3aCe5L6H5NA7+txekHB4=
X-Google-Smtp-Source: AGHT+IF5UkCJdJKXlr6Gth/qwcAe2dPAWhiuJkFRY5Ifo8BeEAGB6I3vdou2q1Tu4uhuVuZOOpDIp5dIYPVIef5NDe0=
X-Received: by 2002:a17:907:9707:b0:b53:e871:f0ea with SMTP id
 a640c23a62f3a-b7a247f6120mr1199899066b.56.1765289679946; Tue, 09 Dec 2025
 06:14:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aTfIHE_2-iKIrwqv@stanley.mountain>
In-Reply-To: <aTfIHE_2-iKIrwqv@stanley.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Dec 2025 16:14:03 +0200
X-Gm-Features: AQt7F2rhjNP1srDjpyNtylnlt2n4nXE0BQJ1nV4SdGEvG-2omw-a6EWOmFv0S24
Message-ID: <CAHp75VdHEVsj9o1UPSS1ikJYofDuiA7KwUaj8v79cJ3Xs=N5xw@mail.gmail.com>
Subject: Re: [PATCH] leds: rgb: leds-ktd202x: Fix error code in ktd202x_setup_led_rgb()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kate Hsuan <hpa@redhat.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 8:56=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> Return -EINVAL if the "reg" value is invalid.  This is unlikely to
> happen in real life because it comes from the firmware, whether from
> device tree or ACPI.

...

>                 if (ret !=3D 0 || reg >=3D chip->num_leds) {
>                         dev_err(chip->dev, "invalid 'reg' of %pfw\n", chi=
ld);
>                         fwnode_handle_put(child);
> -                       return ret;
> +                       return ret ?: -EINVAL;
>                 }

I think the better fix is to split the original conditional to two.

And make the message something like
"can't retrieve 'reg' property of %pfw\n'
for the case if (ret).

--=20
With Best Regards,
Andy Shevchenko

