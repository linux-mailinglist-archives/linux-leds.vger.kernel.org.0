Return-Path: <linux-leds+bounces-892-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4A885EBE9
	for <lists+linux-leds@lfdr.de>; Wed, 21 Feb 2024 23:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9E362850E3
	for <lists+linux-leds@lfdr.de>; Wed, 21 Feb 2024 22:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585263EA8E;
	Wed, 21 Feb 2024 22:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hpbKQrTC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B77510953
	for <linux-leds@vger.kernel.org>; Wed, 21 Feb 2024 22:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708555483; cv=none; b=IFPq9v9oBdbd4QwFDlZX1SOJl8KOc4ti7fUUbiRQgRFeRROzxLSLTabd5PE6OhYkx34LrD9NHwVnqiUwbm7bB6942N9Xtmv+zsbUBUFDkrJpp7vW6ztl0aHc5bEafhHPucpivYFnKEAW3JrXtlg7aufXnFyxRHDTwiZhjNeelIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708555483; c=relaxed/simple;
	bh=RC4tI31fIOZp3su17PHYaJtaFUx2oWlHNy6vF8MKmi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMWoTzUXwuXv1TmeRjyrh/hrpuj8Oe0bb3bRTAm9bBUkhdCiwS4/geHgJtcYKZrW18mdbrdyEcCRuAAF04xHcb3mvrNbcyrAgdbSxWjuXCiZ9XlK5De6QN1wr0eHbm9jfEkl40X4m3gTdcdnEJ6cIOfY4opE0YxHZ+YlaZLPtpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hpbKQrTC; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso6113658276.0
        for <linux-leds@vger.kernel.org>; Wed, 21 Feb 2024 14:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708555480; x=1709160280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1E0gzbVlMt+nTGQE9Y6a9K/TasUA67+XJLQHC7xqZZI=;
        b=hpbKQrTCHD3ciTk2R2xG/100QK9dCR/cF7Qj+eqiJ0XKSTSwRSIPMAQ8jMPCqAXaxn
         7EcbrPE6sl2/hOw9uBfF1OfcqzO38Y5A04r/nM3ksTLhhA2TFPvcyzcGJ4IiXgBDy7HV
         ZgFIhFwtEU/Q4W83z5jpmoAZHGQvjl6wQFoO4EkqMd2c5gPseyOwHvKm2B6TLUmNz4sE
         1ffAKI9OTWuAoN2pfeb21EK7nW8NiXoO3AWhjwMLAaOn7HDkovC9TL4iKlSWr0ZFn+PW
         ED/9Rh9SzJvJHTBunrPYvaVV9jrgob/E6R0Xi7tHLaWkr0QyTdrKwUDoKm9khHT9lLq6
         zqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708555480; x=1709160280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1E0gzbVlMt+nTGQE9Y6a9K/TasUA67+XJLQHC7xqZZI=;
        b=HXyxET8H7NntRCS0kPsvVmYgz4tXR6LpR4K9T9YBLiks6J76Pfvil+HdjBDzqk32JU
         Xe/w5074Ncl53US57I2q+EDKbZyP6mR7vIBvCfut2mWFTr3XTJNStpJl0L9/izzxpr2Y
         bKrvP+83li3sIUNTiooW2TYWABDyTUeeoqrMBKHmDXXK161hpqtNjGp2ErW2EJHFI73P
         aZ5/ZLYe3gW+InUXIISuRPOI/pxSSrIYg0fRgEPFTgvCLAjirA5XHAb8ILeAROgiHbba
         XYWngqM4EEwVY+e4o/YAtxEgfT8LVQrSQbOBmwybvZ7+lT2H8uD+MEVuE7Z5vHQWPvM4
         pJ1w==
X-Forwarded-Encrypted: i=1; AJvYcCWFBXP7yzHf8ex94DYRixrTg/mX7xm+D6tCMOpRubtyeCu+FtQS0jt4bif1s4i3nMDJCVhaD2uHa0a2PQMh5aU7ozKe8x1IlEswRg==
X-Gm-Message-State: AOJu0YzhPka/uIK2neRHWayiQd2+0pwzxXL4xissHTK6DDuxQCItMqLx
	ZouXW4ZHQ5QOJnny/fRT29xw3tgtIqw/Jtm6tDhdj0bco2VfO4o22WV4ZslMtN+wl3ehsZl1wQO
	2pAdKH0WWiFJ17/9g/pxQwqDNz7tsh5w/73Qghw==
X-Google-Smtp-Source: AGHT+IHuu4Lp2pW2NjzZuLZxH6vx6PUKD/LiuL+7y9Bacxbpsq6vZLxkcOzHR67PhVx1mA6/6VAv6KIjsFFUQoZC/sM=
X-Received: by 2002:a25:ada1:0:b0:dc7:46b7:b7f6 with SMTP id
 z33-20020a25ada1000000b00dc746b7b7f6mr743897ybi.28.1708555480555; Wed, 21 Feb
 2024 14:44:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220111111.133826-1-herve.codina@bootlin.com> <20240220111111.133826-2-herve.codina@bootlin.com>
In-Reply-To: <20240220111111.133826-2-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 23:44:29 +0100
Message-ID: <CACRpkdYWiwR_QBsiCESPYfQSsoiThn6hZyLAJA3u0bzTUNvBYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: Introduce gpiod_device_add_link()
To: Herve Codina <herve.codina@bootlin.com>, Saravana Kannan <saravanak@google.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looping in Saravana, he should always look at patches like this.

On Tue, Feb 20, 2024 at 12:11=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:
>
> With device-tree, some devlink related to gpios are automatically added
> when a consumer device is added and the attached node has phandles
> related to GPIOs.
> In some cases, the real device used to get the gpio during a probe() can
> be related to an of-node parent of the of-node used for the already done
> automatically devlink creation.
> For instance, a driver can be bound to a device and, during the
> probe(), the driver can walk its of-node children to get the GPIO
> described in these children nodes.
> In that case, an additional devlink between the device attached to the
> driver and the gpio consumer need to be created.
> Indeed, if the GPIO is removed, the consumer/supplier dependency should
> lead to remove first the consuming driver before removing the supplier.
>
> In order to give the possibility to this kind of driver to add additional
> devlinks, introduce gpiod_device_add_link().
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/gpio/gpiolib.c        | 32 ++++++++++++++++++++++++++++++++
>  include/linux/gpio/consumer.h |  5 +++++
>  2 files changed, 37 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 8b3a0f45b574..416ab334b02d 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4195,6 +4195,38 @@ static struct gpio_desc *gpiod_find_and_request(st=
ruct device *consumer,
>         return desc;
>  }
>
> +/**
> + * gpiod_device_add_link - Add a link between a GPIO consumer and a GPIO=
.
> + * @consumer: GPIO consumer.
> + * @desc: GPIO consumed.
> + * @flags: Link flags, see device_link_add().
> + *
> + * This function can be used for drivers that need to add an additional
> + * consumer/supplier device link to a GPIO.
> + *
> + * Returns:
> + * On successful, the link created.
> + * NULL if the link was not created due to a missing GPIO parent.
> + *
> + * In case of error an ERR_PTR() is returned.
> + */
> +struct device_link *gpiod_device_add_link(struct device *consumer,
> +                                         struct gpio_desc *desc,
> +                                         u32 flags)
> +{
> +       struct device_link *link;
> +
> +       if (!desc->gdev->dev.parent)
> +               return NULL;
> +
> +       link =3D device_link_add(consumer, desc->gdev->dev.parent, flags)=
;
> +       if (!link)
> +               return ERR_PTR(-EINVAL);
> +
> +       return link;
> +}
> +EXPORT_SYMBOL_GPL(gpiod_device_add_link);
> +
>  /**
>   * fwnode_gpiod_get_index - obtain a GPIO from firmware node
>   * @fwnode:    handle of the firmware node
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.=
h
> index db2dfbae8edb..4feed4e166b0 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -7,6 +7,7 @@
>
>  struct acpi_device;
>  struct device;
> +struct device_link;
>  struct fwnode_handle;
>
>  struct gpio_array;
> @@ -106,6 +107,10 @@ void devm_gpiod_put(struct device *dev, struct gpio_=
desc *desc);
>  void devm_gpiod_unhinge(struct device *dev, struct gpio_desc *desc);
>  void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs);
>
> +struct device_link *gpiod_device_add_link(struct device *consumer,
> +                                         struct gpio_desc *desc,
> +                                         u32 flags);
> +
>  int gpiod_get_direction(struct gpio_desc *desc);
>  int gpiod_direction_input(struct gpio_desc *desc);
>  int gpiod_direction_output(struct gpio_desc *desc, int value);

The function as such is pretty straight forward, but the cross call
here happens on instatiated
devices etc, and we need to know why this can't be done earlier when sortin=
g out
the dependencies in the device tree e.g.

Yours,
Linus Walleij

