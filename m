Return-Path: <linux-leds+bounces-316-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD41809CA0
	for <lists+linux-leds@lfdr.de>; Fri,  8 Dec 2023 07:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9106F1F210A8
	for <lists+linux-leds@lfdr.de>; Fri,  8 Dec 2023 06:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B94F7479;
	Fri,  8 Dec 2023 06:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poAC46PK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA864A25
	for <linux-leds@vger.kernel.org>; Fri,  8 Dec 2023 06:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0810C433C7;
	Fri,  8 Dec 2023 06:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702018689;
	bh=GMos9O4HmmM+U55/J8+WlvlVh/uZHHlzuooomDAHT8c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=poAC46PKgZhBiAFlrbze1CMXAMTKpwovQsFdJgOEkVmN7GQu2TDRfmUPf2AQwHWlH
	 /ltyjzWd2/4XtT6kOALILrTKGzZDC1lfoxJsseDAKV1Kpd+wIFGr0A/kqzizofxPNH
	 OF/O9+bD8mzuE9+tbQ5cgYrWesJYMKUdHiqesRvRssMTJaSkwkuaDb1Xtv3OEHTguz
	 XlI2+YnDRUIAJ7hxsJqWtO6XzwItfBxmpl9x1qG65JaJcY3GOxr9Gu+5MEB8UzAKk/
	 og1GQzvJy+IJm9LNkS68ooB6lwUJtl8WkbFO67PyeK6Ly9OhgssdWURyDZ35lE0bka
	 LigbPHxmusB6g==
Date: Fri, 8 Dec 2023 07:58:04 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>, Lee Jones <lee@kernel.org>, Pavel
 Machek <pavel@ucw.cz>, Jakub Kicinski <kuba@kernel.org>, Christian Marangi
 <ansuelsmth@gmail.com>, "David S. Miller" <davem@davemloft.net>, Li Zetao
 <lizetao1@huawei.com>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 1/2] leds: trigger: netdev: extend speeds up to 10G
Message-ID: <20231208075804.4f8559e6@dellmb>
In-Reply-To: <cdcab57e-ef73-436d-8dac-f92219e4cbf9@lunn.ch>
References: <99e7d3304c6bba7f4863a4a80764a869855f2085.1701143925.git.daniel@makrotopia.org>
	<20231207172923.62ce530e@dellmb>
	<cdcab57e-ef73-436d-8dac-f92219e4cbf9@lunn.ch>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Dec 2023 18:11:29 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> On Thu, Dec 07, 2023 at 05:29:23PM +0100, Marek Beh=C3=BAn wrote:
> > On Tue, 28 Nov 2023 04:00:10 +0000
> > Daniel Golle <daniel@makrotopia.org> wrote:
> >  =20
> > > Add 2.5G, 5G and 10G as available speeds to the netdev LED trigger.
> > >=20
> > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > > Reviewed-by: Andrew Lunn <andrew@lunn.ch> =20
> >=20
> > So what will happen when there are more speeds? Will we create a
> > separate file for each speed?
> >=20
> > Will we have a separate sysfs file for 10, 100, 1000, 2500, 5000,
> > 10000, 20000, 25000, 40000, 50000, 56000, 100000, 200000, 400000,
> > 800000 ?
> >=20
> > These are all speeds from include/uapi/linux/ethtool.h.
> >=20
> > Maybe we should have reused ethtool link mode bits, or something... =20
>=20
> That gets pretty ugly. The bits are not in any logical order, since
> they just get appended onto the end as needed.
>=20
> > Also, the files should only be present if the requested speed is
> > supported by the net device. So if 2500 mbps is not supported, there
> > should no be link_2500. =20
>=20
> Yes, this would be nice. We have the information in the phy_setting
> settings[] table in phy-core.c.

What if the netdev does not have a PHY? The MAC also has speed
information. Maybe create a function
  bool dev_supports_speed(netdev, speed)
?

Marek

