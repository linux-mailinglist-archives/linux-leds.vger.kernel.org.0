Return-Path: <linux-leds+bounces-2315-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF8D93BFD1
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 12:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 965512833DA
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 10:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CBA198E63;
	Thu, 25 Jul 2024 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dm7hW8QZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81CD1741F0;
	Thu, 25 Jul 2024 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721902965; cv=none; b=OGoYRps1jl/w20rvul56i/GZ6PRF7cHpYYFSfUHrQgukCc1OI6jz+WmIdOkHFvTeb4t8sI/HCVIoy33sDMkqzz7So0n9SQLfwSzDaXHZGe3nLfuy9M2H6WJTAmHubo76hoZXna2vEmZtDBLh8UgJQ7SYAVwrOON8Zd5IJl2J29A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721902965; c=relaxed/simple;
	bh=3qFhU+Y9MXc9OmpxW465huXr5oqytMjuCzZaj34RsJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Swk7YycxBpGLRptbH1iwjYhNRAHnuVtOViG0/fE/B748nR07y5g45LKG/CWpgWNVgtGLSmQORWUWm4GZERtV1B0MkyzbCOqOEEzv1qC/jD7oEI9nfQJ8c7l7IKl62ayIXDeyqQ2oynaUDO9OfprczBDEhy8uihp8IAwT/TB+ZMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dm7hW8QZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9436C116B1;
	Thu, 25 Jul 2024 10:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721902964;
	bh=3qFhU+Y9MXc9OmpxW465huXr5oqytMjuCzZaj34RsJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dm7hW8QZInpGLQ+lLuiBtOJHE9i9CGYD58Dweu2MaEcaG6m4p4I1LjAR++L5hSV1K
	 QM/eedUv549InZvVk2u7NWWPvXvm0jtdoC28d1qrzHoQQKBQgfgs60prHqJAfymtjT
	 0vUMDOdBpOuAuCAig/W8mw4EXKgEB2walVDb6XavsEKx1lxwK0/Oat30R8mt4LXtGX
	 Vgw+nXSCsZIZjznHn38DxYwWEYCCHN2JggpuoV9AIPBFKwC4dl5omk4229RPjnT/Im
	 HQWceD61rc6+23vrXIZEW1jYL2jf2bI9NQ4lj8Mm2NWYB7Y1PzvK8+yQE6JVoAAf8X
	 II9Smq5nMe7MQ==
Date: Thu, 25 Jul 2024 11:22:40 +0100
From: Lee Jones <lee@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Kees Cook <kees@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] leds: gpio: Set num_leds after allocation
Message-ID: <20240725102240.GE501857@google.com>
References: <20240716212455.work.809-kees@kernel.org>
 <c16715ff-1e47-4a73-8fcb-87462069b5ca@embeddedor.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c16715ff-1e47-4a73-8fcb-87462069b5ca@embeddedor.com>

On Tue, 16 Jul 2024, Gustavo A. R. Silva wrote:

> 
> 
> On 16/07/24 15:24, Kees Cook wrote:
> > With the new __counted_by annotation, the "num_leds" variable needs to
> > valid for accesses to the "leds" array. This requirement is not met in
> > gpio_leds_create(), since "num_leds" starts at "0", so "leds" index "0"
> > will not be considered valid (num_leds would need to be "1" to access
> > index "0").
> > 
> > Fix this by setting the allocation size after allocation, and then update
> > the final count based on how many were actually added to the array.
> > 
> > Fixes: 52cd75108a42 ("leds: gpio: Annotate struct gpio_leds_priv with __counted_by")
> > Signed-off-by: Kees Cook <kees@kernel.org>
> 
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Thanks
> -- 

Using the signature tag in the middle of an email turns the remainder of
the body into a signature block, which is odd to say the least.  By all
means sign-off in the middle of a mail, but please refrain from
converting the rest of the mail.

> Gustavo
> 
> > ---
> > Cc: Lee Jones <lee@kernel.org>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: linux-leds@vger.kernel.org
> > ---
> >   drivers/leds/leds-gpio.c | 9 ++++++---
> >   1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> > index 83fcd7b6afff..4d1612d557c8 100644
> > --- a/drivers/leds/leds-gpio.c
> > +++ b/drivers/leds/leds-gpio.c
> > @@ -150,7 +150,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
> >   {
> >   	struct fwnode_handle *child;
> >   	struct gpio_leds_priv *priv;
> > -	int count, ret;
> > +	int count, used, ret;
> >   	count = device_get_child_node_count(dev);
> >   	if (!count)
> > @@ -159,9 +159,11 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
> >   	priv = devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);
> >   	if (!priv)
> >   		return ERR_PTR(-ENOMEM);
> > +	priv->num_leds = count;
> > +	used = 0;
> >   	device_for_each_child_node(dev, child) {
> > -		struct gpio_led_data *led_dat = &priv->leds[priv->num_leds];
> > +		struct gpio_led_data *led_dat = &priv->leds[used];
> >   		struct gpio_led led = {};
> >   		/*
> > @@ -197,8 +199,9 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
> >   		/* Set gpiod label to match the corresponding LED name. */
> >   		gpiod_set_consumer_name(led_dat->gpiod,
> >   					led_dat->cdev.dev->kobj.name);
> > -		priv->num_leds++;
> > +		used++;
> >   	}
> > +	priv->num_leds = used;
> >   	return priv;
> >   }

-- 
Lee Jones [李琼斯]

