Return-Path: <linux-leds+bounces-4400-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E63A7BF0E
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 16:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF5B9189BDFE
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 14:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1643F1EEA30;
	Fri,  4 Apr 2025 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgPQuivZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF46847B;
	Fri,  4 Apr 2025 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776579; cv=none; b=C/4e0+JwIq16aWt6xaSIohwzUQ56IFGm+cPLI2uFFtaIk3Fk1wpw0mZVsN0Ku3mv8unpJtsqd2nqE1Xs9WBLowJRg72hkRG+BHVWf2bXUf3tfoDdPqRXAjj9aZpzlZUC5d2XXnbgitN2vAM5fBQXguaotPJ22PrL2ZdoMBMLN28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776579; c=relaxed/simple;
	bh=2qJf6zP64vzprrGD35g/7sy6NgE31nyn+6LpCbHwEnU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GLDC4Wzpvp8tKurTZDBIH/S7odM6jEA4kTvrj1oXefCGUAVWBpoiZGWTM/N/G6g9e2zZ5TL8GDHoT1Ikz8JreqMUMoinwIzuErD9K8UCJNsQKfwHjOPxHkK9klKTaedWzNem9Q7v85aIG6+kprxDOU6OWCXRVJDOpQfzuq0An8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgPQuivZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6FDC4CEDD;
	Fri,  4 Apr 2025 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743776578;
	bh=2qJf6zP64vzprrGD35g/7sy6NgE31nyn+6LpCbHwEnU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=KgPQuivZkuCVhiIeNsut8DHr7tDfsA6jAfo/HcSgAwgMRKi1Fxs4TToW7E2D6j2OW
	 7WzVmzZkzKJZ9tGQbGY0M/NH4lo61MrpsdfT106ANcauDfIo7NTL997fCmhCHnP0bM
	 oGwM3mU9BGtjgu/IpHFZXDtc+593PUtdRa+0HTZjDYlnLRqMV76eNptMjpL795xy1x
	 AgA4YQgqjEOKUQQjH96Hp3NCyVrMtJVFjuduEzO4Nj5SZJ9qh5DmfWTPzTpPBOE4Ft
	 RL0Sk1ibWlU3vBwiKY+Psv35r/i9TFAgwrR1XVZBrQoPIdUACIdaLsdoSQB3bVkv0n
	 H5QJ3iQu81SrA==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, corbet@lwn.net, 
 vicentiu.galanopulo@remote-tech.co.uk, linux-leds@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Manuel Fombuena <fombuena@outlook.com>
In-Reply-To: <CWLP123MB5473137572529F99746F4AC4C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473552E76AE71CDE3085DA9C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <CWLP123MB5473137572529F99746F4AC4C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Subject: Re: (subset) [PATCH 2/2] Documentation: leds: remove .rst
 extension for leds-st1202 on index
Message-Id: <174377657659.371330.11608077872257735441.b4-ty@kernel.org>
Date: Fri, 04 Apr 2025 15:22:56 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Tue, 25 Feb 2025 22:02:28 +0000, Manuel Fombuena wrote:
> No other LED driver is listed on index.rst with the extension .rst.
> Remove it.
> 
> 

Applied, thanks!

[2/2] Documentation: leds: remove .rst extension for leds-st1202 on index
      commit: e9902304002133708fbbfa940c1cc200d249b143

--
Lee Jones [李琼斯]


