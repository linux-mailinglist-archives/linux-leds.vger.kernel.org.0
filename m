Return-Path: <linux-leds+bounces-2043-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B639100C4
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 11:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD1BC2841A4
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 09:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F8E1A4F13;
	Thu, 20 Jun 2024 09:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4e83XS0"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50532433BB;
	Thu, 20 Jun 2024 09:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876974; cv=none; b=V02bzFBhKyydZ08I2mJPyzyxADIna9sXLRVmxHD6c27w6nD7M30UDLq9tgLP89A81EW5VC9Mi36wYibNj6Q7Pe73QVRYcWCVw/kARt09ZJ4NLS9VOvrw0nizOcZmOkorxqbCWmA17SYmEAc5VfDwbtyBvRETqQbc98gZZzKQiOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876974; c=relaxed/simple;
	bh=ElOitkQAXYYrGqSAaLi85lpCU0nQejASepHcMkfYcos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifvrZZ/L8gk07L4tW9rUw15v5/vHln7Q3DxGvgTxhdsTLC4HCI5U7Oz+mZXMpaNiZK42oGAopBX1fWUk3CFeKi6JQyD939E3zTz/Rg88QdhuHzsSmWrfXZ/PiymREX9FKm78+iZpgci24WhkC+i6O4MaMaByLcO2Q22865mp6lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4e83XS0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA077C2BD10;
	Thu, 20 Jun 2024 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718876973;
	bh=ElOitkQAXYYrGqSAaLi85lpCU0nQejASepHcMkfYcos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4e83XS0p3A60BOw7Kb8mtpIG7ZAGO5JnEV+/Q4JQrU5jEFbc/MmoEApmzeOTvH8d
	 FNRL0WZuNJDXI6zdPVB582pNKzJo0f7htbHnLyB0PvwmQ8LcvFXK+VXhmPP7VzfzMn
	 3lURf+K36z2Aa+8ZJvbOZefQNOfGn+DU/vvxrPGywRiMTHe2ll17R0Vl0CUnIsgTjE
	 DoGuKX4mqxUhk3t0KQRj+Gw5NVV4LHDy+XA94fFrRv57TuOCLhtsRGN9+6XQay8FE3
	 lzvLjX4/TL4PC0h6LVUSLMZreq+9G1BHqeQUHDZ0SHPrQ3HEkHY7LvzV8+q5FxUMi1
	 qXIKatHNRgv/g==
Date: Thu, 20 Jun 2024 10:49:29 +0100
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Hans de Goede <hdegoede@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, regressions@lists.linux.dev,
	linux-leds@vger.kernel.org, Genes Lists <lists@sapience.com>,
	Johannes =?iso-8859-1?Q?W=FCller?= <johanneswueller@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] leds: class: Revert: "If no default trigger is given,
 make hw_control trigger the default trigger"
Message-ID: <20240620094929.GK3029315@google.com>
References: <20240607101847.23037-1-hdegoede@redhat.com>
 <171887679701.1126294.11039062848140573919.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171887679701.1126294.11039062848140573919.b4-ty@kernel.org>

On Thu, 20 Jun 2024, Lee Jones wrote:

> On Fri, 07 Jun 2024 12:18:47 +0200, Hans de Goede wrote:
> > Commit 66601a29bb23 ("leds: class: If no default trigger is given, make
> > hw_control trigger the default trigger") causes ledtrig-netdev to get
> > set as default trigger on various network LEDs.
> > 
> > This causes users to hit a pre-existing AB-BA deadlock issue in
> > ledtrig-netdev between the LED-trigger locks and the rtnl mutex,
> > resulting in hung tasks in kernels >= 6.9.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] leds: class: Revert: "If no default trigger is given, make hw_control trigger the default trigger"
>       commit: 3acc45f2ceb0609812522e45aec4cb9516e1c586

Cancel.

It looks as though Linus did end up picking this up, just silently.

-- 
Lee Jones [李琼斯]

