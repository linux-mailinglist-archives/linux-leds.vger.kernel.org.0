Return-Path: <linux-leds+bounces-4851-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE97AE01FE
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 11:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1613017F75B
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 09:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A6A220F3F;
	Thu, 19 Jun 2025 09:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrdVI+FI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1B221C161;
	Thu, 19 Jun 2025 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326483; cv=none; b=IsWItahESNDy+UhyoJY8iMxBhI0Muwkz40t+Sj7Mygy9GguDAT3x9XYnMJN4HrRN2OAixuFy7ebqcu8jSkdTZgXiNv3YMQv3hgXro2qvad/qRspZ3CfnUE1q/WLwmUwQY1uXxYWyGl7B7g0I7UqxekxGLOFQ2uJnrutrz9YiORM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326483; c=relaxed/simple;
	bh=BV8lbAZGFsql8RhStTAYqOlvNxb6FntQtCUeglMev+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QY4cpKNf9A5KSn4/GimurCL2uab3YFPP7ftpkjJI31DdjITh/uLfsNp50rK9CXaNCBElDdVOn8gnNUOSuea04SeUu+lHXiz8lH7IPCbQYuLjM9jq5z7izuz25YHNfNu9tkFyiQbaDPruk6wTHoj5aIgLCyEP4GLuHnAKJMoOn6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrdVI+FI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D222C4CEEA;
	Thu, 19 Jun 2025 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750326482;
	bh=BV8lbAZGFsql8RhStTAYqOlvNxb6FntQtCUeglMev+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HrdVI+FI1D4PEC+Tw5PdCpKmsaqcKD4Kqdr5VQexXAfrxZZYgLw3a+m8KH3+WIszh
	 PlULnBBrW9ic8vRVa8zki9RdnaOPB0d2ovN86WJnA/3fRmPfIx/Lx37U5UUvn6+5+R
	 PtRJf5gN2cPC1aie9/hLnyMwamYdhhw+TrVMuTdfKYk6Tls+/LKFM9sW6uYqCuV/sn
	 KVRmSXZyKcyXTFsEViWHaC6QkSR/wloKGMssIcRrmVh6fW3d1v42oruZGm0I267Q6r
	 WZyIAfHx45b2DZAaUAnim3FyWfzqgZXGXoLhSkLKvA5RleuYfUJRmlHyQZDYIn4/TO
	 sqdqUPQtbietw==
Date: Thu, 19 Jun 2025 10:47:57 +0100
From: Lee Jones <lee@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Werner Sembach <wse@tuxedocomputers.com>, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net,
	cs@tuxedo.de, ggo@tuxedocomputers.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
Message-ID: <20250619094757.GB587864@google.com>
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
 <41de4cd4-2a27-4b14-a1c0-e336a3cec317@tuxedocomputers.com>
 <d645ba09-1820-4473-96bb-8550ed0b0a26@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d645ba09-1820-4473-96bb-8550ed0b0a26@gmx.de>

On Tue, 17 Jun 2025, Armin Wolf wrote:

> Am 16.06.25 um 14:46 schrieb Werner Sembach:
> 
> > Hi, small additon
> > 
> > Am 15.06.25 um 19:59 schrieb Armin Wolf:
> > > +        functionality.
> > > +
> > > +What: /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/rainbow_animation
> > > +Date:        Juni 2025
> > > +KernelVersion:    6.17
> > > +Contact:    Armin Wolf <W_Armin@gmx.de>
> > > +Description:
> > > +        Forces the integrated lightbar to display a rainbow
> > > animation when the machine
> > > +        is not suspended. Writing "enable"/"disable" into this file
> > > enables/disables
> > > +        this functionality.
> > > +
> > > +        Reading this file returns the current status of the rainbow
> > > animation functionality.
> > > +
> > > +What: /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/breathing_in_suspend
> > > +Date:        Juni 2025
> > > +KernelVersion:    6.17
> > > +Contact:    Armin Wolf <W_Armin@gmx.de>
> > > +Description:
> > > +        Causes the integrated lightbar to display a breathing
> > > animation when the machine
> > > +        has been suspended and is running on AC power. Writing
> > > "enable"/"disable" into
> > > +        this file enables/disables this functionality.
> > > +
> > > +        Reading this file returns the current status of the
> > > breathing animation
> > > +        functionality.
> > 
> > maybe this would be better under the /sys/class/leds/*/ tree if possible
> 
> I CCed the LED mailing list so that they can give us advice on which location is the preferred one for new drivers.

No need to involve the LED subsystem for a hardware function controlled
by a single register value just because the interface involves an LED.

-- 
Lee Jones [李琼斯]

