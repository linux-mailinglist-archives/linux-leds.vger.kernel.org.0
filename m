Return-Path: <linux-leds+bounces-2841-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EABD2987E80
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 08:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A05851F2378B
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 06:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480F8176FDF;
	Fri, 27 Sep 2024 06:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ir6dw+iR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA30215D5C1
	for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2024 06:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727419017; cv=none; b=Q8xawGXHHe73oppUu6pZ1fn1d+3n6thjBYkJ8Mt5EBayXovZXyJuPx6gfzaW1g26pLoOjAuxOlD3ySrcIoAfAUGUj4fwhI1vBhtD18KBeFzX4Jjvt1SjPe7TrvB0BOyrweH0YmZU+GW8yIcyQ8Id/oFFv1qu+g8jzFWq0Mbs3Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727419017; c=relaxed/simple;
	bh=vXRBt6+WPBCXEvFEojsG0JdYGPjOPLdAL5vKh0gVANs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvUrvwvNUj2dZDCwhUTWAd6LKWuKX5PUIjEJOAuHSQLLAJUWlHg3eVoE3CCo3EkOi2jYIGF6mO42QVcsDCJ6z6Pyy1az01GkAkJYSHUDHftqWdw/XW5HTlOPgR18f/duBMvHiNHaYoercg2w3e6nkVCXlyHdRbMO1FgZq0qwARc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ir6dw+iR; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f7502f09fdso15682021fa.1
        for <linux-leds@vger.kernel.org>; Thu, 26 Sep 2024 23:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727419013; x=1728023813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXRBt6+WPBCXEvFEojsG0JdYGPjOPLdAL5vKh0gVANs=;
        b=Ir6dw+iR6CtrY6N8rAQP/9siA6b/w1RYmRMxMXL4xVzlD7DrRTWG1Min89TymutdOA
         L6/OVskjjBlGWqLfBTKh/bqG9fl7TWu13pdj2VzMvUz9Cox2Hz9QWhuoph+uEt4YXpYl
         r3JHwnYtcDWyjHDybSgkhLF7o7J3ypmO5Xss3tZQGNcFzSKQvUIUvVpgEY7stIWA/x0Q
         t7RwOj1yOKShQKHTrNxFZNqYNXJAcVoZlM5428n1oM3kvpe7toPSBoCPhb6+p7j0BulC
         x5cDedVRIj8JDeFVnRYSUtxWA0jYVkEHWLyutR0WulhnasM4B0DOUikS8mxSs7BuyW7o
         dMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727419013; x=1728023813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXRBt6+WPBCXEvFEojsG0JdYGPjOPLdAL5vKh0gVANs=;
        b=eBH+nJu9JCRfusAXn1EMQW1e49bMcdOEdwNzKfVDDn/14eruGcMopnti8PcQwrSQEc
         OMO1Qjxw38wBWnkSd8Gw9ivAN6wd35W1sKdPuyAvvjtWa0na3as3kIbro7OmW8qT/Ij9
         GqWZPte2OTVygZwVGgGUrut9jIwubzioWyok1uC/dF659dxC1fMOBlWomp8RWurQDqas
         6Lxs43ARfHV3kTOhZqRMMUnG3AqsoIv56w24wqU+KWRKZ8oGtuKFblIobwggK4K2iBrH
         PHhSaeWaXPjtlsTsnyQMWP2q6qquItTXHJy9WnHlAJD3ma2RELYT2RFRbbXoUPJWGgJl
         AQWg==
X-Forwarded-Encrypted: i=1; AJvYcCVPTcTQxtoR2yO/Y0fCj35eC5asVv3NFUDo6gucUecGHsGMoaHzSigCObj5wTABhuVkQbcj/6udiwPb@vger.kernel.org
X-Gm-Message-State: AOJu0YyP7dYGIw1t7CunvEYAZhtEC5cH8VFcnXQMNZWm6wPxVvvA0bWI
	SB7MkVPt47w57dYErISSichju2kLGn34xwGUkRdF3AyhpqQ0IqokyH6OEK38Z1XHS3p5+AUOEjh
	R5y3jqPxFo89a/ar1lOaoZRzq+Rfin7QuOPQbnw==
X-Google-Smtp-Source: AGHT+IGgFYfXHCal2e51gzgszcfItBm9C194Qyz5q41DI00iOJq9PeBaLsT1ymvZJa7VwGDM3d1wVm/E+xtj8hsF0w8=
X-Received: by 2002:a2e:84a:0:b0:2f4:3de7:ac48 with SMTP id
 38308e7fff4ca-2f9d33928c1mr6048771fa.19.1727419012116; Thu, 26 Sep 2024
 23:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 27 Sep 2024 08:36:40 +0200
Message-ID: <CAMRc=MeXxeXq4m4nvb+P2ZQuYbQ18n4572cwkkHG+=U7nfa7Vw@mail.gmail.com>
Subject: Re: [PATCH 11/18] leds: max77650: switch to device_for_each_child_node_scoped()
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Gene Chen <gene_chen@richtek.com>, 
	Jacek Anaszewski <jacek.anaszewski@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 1:21=E2=80=AFAM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
>
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
>
> After switching to the scoped variant, there is no longer need for a
> jump to 'err_node_out', as an immediate return is possible.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

