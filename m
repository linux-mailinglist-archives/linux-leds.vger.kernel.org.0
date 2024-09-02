Return-Path: <linux-leds+bounces-2574-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 548DA968A1F
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 16:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3C6FB22BB1
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 14:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2E32139D7;
	Mon,  2 Sep 2024 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5w2VWrv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992B72101AA
	for <linux-leds@vger.kernel.org>; Mon,  2 Sep 2024 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725287821; cv=none; b=SoajYF7n6E2WH6YTm02RNj+qlmvJLb6XeSPl1hF603ABff9FbOh+4W8Bi7MgTq188k8LeeaFT9/hfbhq2IntPlksWXxEYib/Ej7NlczSzFUugl9zWNNyy2M2f+Td/fHzegseT52vIWwHKUQMY1z5KS9cVXNh+TynVbi2fB/HL6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725287821; c=relaxed/simple;
	bh=SlupeQoZoxaS1YW/9lDWj5i+TCp/8XoU0PIkXcNt8BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0iURjmgsa1Wah0S+5uZ3Rx+8XamA1gGiNM9efE8oDK1mxxx1Zczrt4EJeXXQ/O+FLIhluM8TUGvyCdg8tDdIC2yV7tx0x6RzOVBurXAUHCvPHYFaXx3ueCvLjsfjWaNezCACs5G7IawJTiKgm1Fa+vszRd1VyCTPHaYf5ikRuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5w2VWrv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574ADC4CEC2;
	Mon,  2 Sep 2024 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725287821;
	bh=SlupeQoZoxaS1YW/9lDWj5i+TCp/8XoU0PIkXcNt8BM=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=W5w2VWrvl8llTENsREb+61pkZkoIQ7IrPHrxjFx+4bKv7p4WYai9YK2/w4JnUezDW
	 n4/pO0G0U3yyuKSyCn4E8UiQzGAzTShdWfGIDTdicseef6YwPHKTmA3HCOeugxQ8xl
	 nMWAtzpxYEsYwC3UzdI5VN4yXsior2kkItFEoWfIpPLsaybeh1LEjIwlP7iC1XGfDS
	 Ko6UD5YmSnqAf/ku1o6O7degBkS6QV6ZRjkHHP4jCPOpEoVLJc1sfLOzW/JQO5BceL
	 qLxkmUQwd1YZgVDXU5naIHJdk+uU4gp/7VBN2W6GlsSEAHEh4Ccw+q4/VhCZcjxEGD
	 5h38Rjr/EukvA==
Date: Mon, 2 Sep 2024 16:36:55 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH leds 5/8] leds: turris-omnia: Notify sysfs on MCU global
 LEDs brightness change
Message-ID: <qn6az5grddl7ywf3yv72jjm36ovxqngpmgzt7kv77yyoulj25u@kbmcwws3lji5>
References: <20240902124104.14297-1-kabel@kernel.org>
 <20240902124104.14297-6-kabel@kernel.org>
 <ZtW625-GePwV8ffA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtW625-GePwV8ffA@smile.fi.intel.com>

On Mon, Sep 02, 2024 at 04:17:15PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 02, 2024 at 02:41:01PM +0200, Marek Behún wrote:
> > Recall that on Turris Omnia, the LED controller has a global brightness
> > property, which allows the user to make the front LED panel dimmer.
> > 
> > There is also a button on the front panel, which by default is
> > configured so that pressing it changes the global brightness to a lower
> > value (unless it is at 0%, in which case pressing the button changes the
> > global brightness to 100%).
> > 
> > Newer versions of the MCU firmware support informing the SOC that the
> > brightness was changed by button press event via an interrupt.
> > 
> > Now that we have the turris-omnia-mcu driver, which adds support for MCU
> > interrupts, add the ability to inform the userspace (via a sysfs
> > notification) that the global brightness was changed.
> 
> ...
> 
> > +	ret = devm_device_add_group(dev, &omnia_led_controller_group);
> 
> AFAIU the intention is to remove that API, hence this shall not be used.
> Greg?

OMG yes this should be with the group .is_visible method.
Sorry.

