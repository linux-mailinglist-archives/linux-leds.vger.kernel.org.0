Return-Path: <linux-leds+bounces-2594-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5835A96A365
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 17:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AD311C24045
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 15:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCE9188921;
	Tue,  3 Sep 2024 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Qy/sQZNp"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F541509B4
	for <linux-leds@vger.kernel.org>; Tue,  3 Sep 2024 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725378995; cv=none; b=aSLaZyUkfj3938j3hhXU/Q9KotnLzNi+3Nn6l/l+FzGtGr/PNYJPtIVOkCDwMoICqH2ecFpf/zCM521opMGCjrfstAJWBLpo76yiPcFqpg9jKqYi/rRwU904TVmoykKR2lGU2MCHVWZHTj00QyTOV51LcQwJyB8LfwaIV7u/uxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725378995; c=relaxed/simple;
	bh=SEaDveqJYdECABo5foXkypUI80ZUyNwo0i916ooHULM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsVV7cvuXxor0o9frLbTKvLQq9I35KHFK4BlVDVqZIQ0l+STL5nt93X9vBDxwEuHfiYOxLJrQuR12BZwMAYSbxYPzG22WaNVc266vE13muJo6RvV8aYQdAjIH8kvDwCBS48qjWEM3ZJk6JYNv6kaf1fF22vsAyUQC6oce1E0O+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Qy/sQZNp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=dLrp3ZxRXHd3ZuhyiaBxb0aOt9XQW5+dH/UrXRC7tYQ=; b=Qy
	/sQZNp4dpPEMV8L+MzsXPVkULGRjRAfhMiGV4HcR4w8tRLvKallJI44QKlszZsXv5gWbNtdFfVeB1
	Oxi7kNkV2xxiBtc2Y3bBM09VnIKamALZuTH/m97TcyEafI2mI5EtV+w/pBuG8eo/aNWIigAnBPWCP
	VXpVDCnuHpkGv8U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1slVtN-006Riv-VY; Tue, 03 Sep 2024 17:56:29 +0200
Date: Tue, 3 Sep 2024 17:56:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH leds v2 08/11] leds: turris-omnia: Use dev_err_probe()
 where appropriate
Message-ID: <224af639-babd-4d6e-813b-70fe07d5e337@lunn.ch>
References: <20240903101930.16251-1-kabel@kernel.org>
 <20240903101930.16251-9-kabel@kernel.org>
 <CAHp75VfEnuJb2s4QWJ3NNeXcx+qwNXf2ypJ6A35ECOEf+TA9EQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfEnuJb2s4QWJ3NNeXcx+qwNXf2ypJ6A35ECOEf+TA9EQ@mail.gmail.com>

On Tue, Sep 03, 2024 at 01:45:49PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 3, 2024 at 1:20 PM Marek Behún <kabel@kernel.org> wrote:
> >
> > Use dev_err_probe() instead of dev_err() + separate return where
> > appropriate.
> 
> ...
> 
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "Cannot set LED %pOF to software mode\n", np);
> 
> Side note: Not sure how np is being used besides the messaging. If
> it's only for the messaging, I would rather see %pfw and fwnode based
> approach.

This board has a number of Ethernet switches described in DT.  Nobody
takes ACPI seriously for any sort of complex networking. So using
fwnode is probably pointless, this board will probably never be used
with anything other than DT.

	 Andrew

