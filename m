Return-Path: <linux-leds+bounces-364-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0843C8117C1
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 16:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5FCB1C20BDA
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 15:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC0D85346;
	Wed, 13 Dec 2023 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1PYCxW5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2B885340
	for <linux-leds@vger.kernel.org>; Wed, 13 Dec 2023 15:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64BDC433C7;
	Wed, 13 Dec 2023 15:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481993;
	bh=6AM6HzmzlNePc9eLi1v9b1TYKvgnhVKKi53VuhnmrQg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k1PYCxW566zHq45yqBcmJpHK212X1cSreNhbOYZ7R/p2dAfWpatw3XDxiXEHxMxrk
	 p2Dw1/2VTcgD9t1r6HgmUIdI8JKO3as8oUBdDAvr2jvz+bxL1QzrV4jZDIWaV9mjZW
	 y6TSUygRnEh+5hsOCOLbF2dC1Rhzx3NlDY8XkJ+zRWM56MRmaVCcJUbHrPToRGByZ+
	 VpLBXhx0oO9iOrBYidh0a+uKmyAdWIM4QBU9WuOSIS/fd1UCc2TQRbe9hxBcDDKU9C
	 GCll0BOAZKtPqOa0whMH+6JUykPC3z7y6uSZ4RzOz3ExAwB2Gj+F6o317uEwP64djV
	 NUgnogJ2lYjHw==
Date: Wed, 13 Dec 2023 07:39:51 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Andrew Lunn <andrew@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Li Zetao <lizetao1@huawei.com>,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Daniel Golle
 <daniel@makrotopia.org>
Subject: Re: [GIT PULL] Immutable branch between LEDs and NetDev due for the
 v6.8 merge window:wq
Message-ID: <20231213073951.4293c0c7@kernel.org>
In-Reply-To: <20231213130555.406aa2ef@dellmb>
References: <99e7d3304c6bba7f4863a4a80764a869855f2085.1701143925.git.daniel@makrotopia.org>
	<170142826116.3357002.9561246405642038358.b4-ty@kernel.org>
	<6577315e.050a0220.50f30.0122@mx.google.com>
	<20231211084656.26578d89@kernel.org>
	<657784f6.5d0a0220.617b5.20ee@mx.google.com>
	<20231211140546.5c39b819@kernel.org>
	<20231213112705.GI111411@google.com>
	<20231213130555.406aa2ef@dellmb>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Dec 2023 13:05:55 +0100 Marek Beh=C3=BAn wrote:
> > No, please don't do that.  None of the branches I maintain are stable.

Nice, /me adds that to the notes.

> Please don't pull this. The sysfs documentation for the link_* files
> does not specify that they are available only if the underlying speeds
> are supported.

Roger that.

