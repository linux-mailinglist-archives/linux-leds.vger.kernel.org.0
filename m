Return-Path: <linux-leds+bounces-4397-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA69A7BD62
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 15:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76A7B7A6B6A
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 13:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8531EFF87;
	Fri,  4 Apr 2025 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jilCrT/T"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AE81EF368;
	Fri,  4 Apr 2025 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772515; cv=none; b=WsU/cZznWZASyniJ8GSGxrEohsdv+gaqPLeDAhFkV0gwI2PlSUnm+uOKekHRGeYDQ4BJNXE4eoZOKRRhcqqI3Vtac4Tg6xTtyrtZyu6pGr1MrKuZuJI1SNFSF7BWg09uYBIVmTQNPll+PZbwzX/y9nUM8/SSxOOeWjFzf7KD1ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772515; c=relaxed/simple;
	bh=IGxrL5BgZiFH0dJXB5NE1pa/a7srB8M2GbffBihs6gA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UgScQuAsG7wtAlgxfidSsGo/siPT9MjrCBQ4P6Ua33uIqMzpk/E0XC/Yn1sO0Ftkh9A9wSq7z7SpDQWsmd7FtFtACfZW7hH+Xa0fIq3qDns9hgRFTt7W3nnJPZ0LrCrW5ED5xynY72MXLdkXQSosZhaQFu9gJrmHOePGmWrr5e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jilCrT/T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993ACC4CEE8;
	Fri,  4 Apr 2025 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743772514;
	bh=IGxrL5BgZiFH0dJXB5NE1pa/a7srB8M2GbffBihs6gA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jilCrT/TCEnmAQsWhuVTpyBVa1iRojZvC8Wn6tbKmshZu62JmURX11vI0PvcMeA0o
	 Vl1IFZSvYeac0qVknGpYym3bvYhS6oMmFDZO0QnZLkbBn1jatpZYnZ3O2sUa1LGY5L
	 QaXY4wzHibviBDtWHFpbkMWmtahZTnA1i4k4C8Kki083swoRPJ5ueQhoeCVFZDHIJT
	 QHRG963XkHDg2O+LbUdtPzB2QkwLwjO1UWxCL/9aUUKt9VV1MuWs2A5BaCtPIJw6UT
	 KOg/AWw/DzIzj92hivbfnsdGZCvt+mkzgJnLgpD2J5nctniRbMRbxYEDb5INrKhoEo
	 KujK2tq5KNp1Q==
From: Lee Jones <lee@kernel.org>
To: Bao Cheng Su <baocheng.su@siemens.com>, 
 Benedikt Niedermayr <benedikt.niedermayr@siemens.com>, 
 Tobias Schaffner <tobias.schaffner@siemens.com>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, 
 Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
In-Reply-To: <20250325092159.213463-1-lukas.bulwahn@redhat.com>
References: <20250325092159.213463-1-lukas.bulwahn@redhat.com>
Subject: Re: (subset) [PATCH] MAINTAINERS: adjust the file entry in SIEMENS
 IPC LED DRIVERS
Message-Id: <174377251236.332082.7427238985144785833.b4-ty@kernel.org>
Date: Fri, 04 Apr 2025 14:15:12 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Tue, 25 Mar 2025 10:21:59 +0100, Lukas Bulwahn wrote:
> Commit 835a0c10d33b ("leds: Rename simple directory to simatic") renames
> the driver's directory to drivers/leds/simatic, but misses to adjust the
> SIEMENS IPC LED DRIVERS section in MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference. Adjust the file entry to this renaming.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: adjust the file entry in SIEMENS IPC LED DRIVERS
      commit: 1c40901331f1cec434407cbb53986505092b50b4

--
Lee Jones [李琼斯]


