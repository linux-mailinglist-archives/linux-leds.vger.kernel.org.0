Return-Path: <linux-leds+bounces-6100-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C08C58701
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 16:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0540135B1C6
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 15:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A642F83BA;
	Thu, 13 Nov 2025 15:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qq5FG20h"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE572F83B5;
	Thu, 13 Nov 2025 15:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763047372; cv=none; b=WXRx30IH8DsxHG/ABbm8M0MyTeU6w7DXsVsjI5H+KEwGxsUiwjmPgl1VEIMIMRTd6DV718NeqvPKT0pLh2vOgprC8CDFwiHZhiIpPbBE/4L6/0QAwMRtQdETnizBsdDI8IWLcEfg4z/C0V7jiJgwAWJdlOIzvdG512m8/wpho+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763047372; c=relaxed/simple;
	bh=Ak5LCSsLVdpZh7VOQJKVIOo/c93CF9xpQr+3rCiQJCY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I08iimAjdeCqecZkagD1HYBVYOA+qHlGTMZ9fQuaXIVJflcL1X5Qc8VMfz5GsM5wLEBnmm48nljUdDzq04P0SijDdrZE214e4o4L0BzZ1vO66gSV09ZmMu5KdVXX5yEn9P81UKi5EMfq7U+JBY7V5ZOoF4tcCmqN1NCTKDRZAAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qq5FG20h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8624C4AF09;
	Thu, 13 Nov 2025 15:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763047371;
	bh=Ak5LCSsLVdpZh7VOQJKVIOo/c93CF9xpQr+3rCiQJCY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Qq5FG20hh4G52+N1vi0r/wi0Lw95b3jvWmJAngF+fQmt/jg/tK9jOpkZw7vXZeACD
	 /Ft+6vt6OL2uY0KXFkiX75g9s8JZf30taGZOUGIfW1m02zn/LCj+dkJFB+x/Mw+Hpq
	 zt7tfH25mGOc+a/y6V/27fss9+r0Pg6fKFfREIfnqfIZ7inKzNG/WcccrJT/DVZKC0
	 MqqMCoL5kNrSNH4d+lebzEk9kFGxlFc6UMSXQU1yapQ+AhBnxSfXymDoJTiyDuyDcf
	 a+GUSBu1NZ70hCoFBwDcT5LXBIhmAfyq7R8/XDqP2aVMEoODJtO2lbll+chjoF9h3J
	 oy86ShgSkHEkg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251103120809.32834-1-thorsten.blum@linux.dev>
References: <20251103120809.32834-1-thorsten.blum@linux.dev>
Subject: Re: (subset) [PATCH] leds: led-class: Replace sprintf with
 sysfs_emit in sysfs show functions
Message-Id: <176304737052.1536060.7510618675723592499.b4-ty@kernel.org>
Date: Thu, 13 Nov 2025 15:22:50 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Mon, 03 Nov 2025 13:08:09 +0100, Thorsten Blum wrote:
> Replace sprintf() with sysfs_emit() in sysfs show functions.
> sysfs_emit() is preferred to format sysfs output as it provides better
> bounds checking.  No functional changes.
> 
> 

Applied, thanks!

[1/1] leds: led-class: Replace sprintf with sysfs_emit in sysfs show functions
      commit: 92f4b016dcb955cc0bb3942ac217cff6fe450a57

--
Lee Jones [李琼斯]


