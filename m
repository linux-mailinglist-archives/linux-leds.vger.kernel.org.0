Return-Path: <linux-leds+bounces-3954-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 595B8A32AEB
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 16:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92B82167A39
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 15:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB76821325C;
	Wed, 12 Feb 2025 15:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N47xDpSd"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19DE213241;
	Wed, 12 Feb 2025 15:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739375717; cv=none; b=nr8v/YgVuCockFkeEuoM+TlQYsXiBywXYXpnpctgUnyqe/hV7dJulUChcPF6akDlkE8B8f6NsKQ+U4BuhygrGrIV7jhtUu+stpSsNAGhxjOvT5zA9LUY5mqJDt2jbMqpLpjNAEx1t0OctZaROlov3cCnMgvs/z/f3f5DdDiZKjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739375717; c=relaxed/simple;
	bh=H3FeOfXF65RY+24bTevOXJFMpv+jr3D9QT2vk77sPcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWxGDhFyUwkdTHHXLeObFICzXgX7HG1F4Ei9QfizJw3DLuYNqoBDWmIgLaXSStom9+iHz51oJ6RpVvSUDd4vQvfbS58wIbTMoHY++FjpQL8/XXqYScWiM16goP901txc6ghw896volsxyHOyIkVQddiqZ0F3+zLmK8430m9UEWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N47xDpSd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDEFC4CEDF;
	Wed, 12 Feb 2025 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739375717;
	bh=H3FeOfXF65RY+24bTevOXJFMpv+jr3D9QT2vk77sPcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N47xDpSdCTMM07GniVZmfE0BC6cF31xRjuX2lCNkftCdqVhfA59U1HKhf8SWGijMU
	 Z9AP3zCaghpwh5PYwn7ogHshDhxExSh79Bj72whAmKpLb4DpgNEkzwulJHwGNKK+TE
	 RGDA5keYo/8nGR8mtYP4jn/RJzyIc9wnggyqinCKoeu0xhY+cnFf9Gw5cyIeuo0piq
	 adr5qvmBwbRMPd8K/6Syo++KHucs16CHxD3FwWdhaIHXUAETRsidYVYs+dUKD83o3s
	 YLePYAw1rYYiSs7NGZUKcOVtExpy++3puvwdT07bc5SW2v3H7q1B1QrZim/hLRM+gh
	 NFkxaQVQ26JAw==
Date: Wed, 12 Feb 2025 15:55:12 +0000
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] leds: aw200xx: don't use return with gpiod_set_value()
 variants
Message-ID: <20250212155512.GE2274105@google.com>
References: <20250212085918.6902-1-brgl@bgdev.pl>
 <CAMRc=MdFwe2onYhwY__n-kAOSrXKKDWJ38hpbYb0711Nx60DHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdFwe2onYhwY__n-kAOSrXKKDWJ38hpbYb0711Nx60DHw@mail.gmail.com>

On Wed, 12 Feb 2025, Bartosz Golaszewski wrote:

> On Wed, Feb 12, 2025 at 9:59 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > While it now returns void, it will soon be converted to return an
> > integer instead. Don't do `return gpiod_set...`.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202502121512.CmoMg9Q7-lkp@intel.com/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/leds/leds-aw200xx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
> > index 08cca128458c..fe223d363a5d 100644
> > --- a/drivers/leds/leds-aw200xx.c
> > +++ b/drivers/leds/leds-aw200xx.c
> > @@ -379,7 +379,7 @@ static void aw200xx_enable(const struct aw200xx *const chip)
> >
> >  static void aw200xx_disable(const struct aw200xx *const chip)
> >  {
> > -       return gpiod_set_value_cansleep(chip->hwen, 0);
> > +       gpiod_set_value_cansleep(chip->hwen, 0);
> >  }
> >
> >  static int aw200xx_probe_get_display_rows(struct device *dev,
> > --
> > 2.45.2
> >
> 
> Lee, Pavel:
> 
> If this is OK for you, can you please provide me with an immutable
> branch so that I can pull it into the GPIO tree? It seems it's the
> only such use-case in the tree apart from the gpio.h header that I can
> fix locally. Alternatively you can just Ack this and let me take it
> through the GPIO tree.

I'm okay with it, but why do you need it?

-- 
Lee Jones [李琼斯]

