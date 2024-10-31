Return-Path: <linux-leds+bounces-3217-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2669B78A5
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 11:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEF2A1C21FE7
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 10:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6923E1991B8;
	Thu, 31 Oct 2024 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDDoiHua"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7AA1940BC;
	Thu, 31 Oct 2024 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730370490; cv=none; b=M/4EiFus5BLNY8i0W0sX28E17ZzNJNyNaRQ4YqO/Xy0ujZoUCyb5z/1GWYppahcs9NMsMLWkhkAl48LrvjpJteUPROxMsaVja+3U4VN2BL4Yc7DUpOTYVNEmQGeUpnczCYBo2oqVQRBvm44Mx7ySdjwPH4QZlUGX5ZymoFNJjYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730370490; c=relaxed/simple;
	bh=lpP3jN+E1ZyJjDX2voI1B2yuCIeUlReyAvg8Xsd6+Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IByJrLNmfL/9bG+lMYZv5DVCpMlk+kflbWt6bWh3HwHcOMMV3YXJR+C5AV7OSq8a9X5+gOU+mm5eqZ8k8aU8/QTs67QuDt974sYdwLccdVC3aLGWE/hhir28oh92ki4WHm2e6N3JDp4gZpscVjdnsudxL+ywuUeg9e688ZNFwZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDDoiHua; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB33C4CEC3;
	Thu, 31 Oct 2024 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730370489;
	bh=lpP3jN+E1ZyJjDX2voI1B2yuCIeUlReyAvg8Xsd6+Zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDDoiHuaI1FnHcr8QVuAxVNYPDXnJ485x2CTeNhbgwxkalsxlLfkFF847Iwg8Cxid
	 Nx4n2fdglIgYxE/+9YJJmxtl6p3Hn3cfHkqS2jdJOZMeCNl+lLyVTb5raZWaQ5W2lz
	 fqi2QPMghm3UbYJ1HxMF7MXYfarp7fM+VC4XRBPgw0jLgGy70LM9tvvNwGz/9PuVXH
	 20spfLzBiCUtwHosh49suuOL3kLYmnKxjJQ+mLwA2rQsIS9pzVQs8IDxbIBOqhZwdx
	 6tc++AIF2RiVFUL1xwG+wgcOPTYgD2Qq+OxdQkBFrK/zHswHPuoaCc1T3iuHyqxX4X
	 f/ozCEuiHbqxw==
Date: Thu, 31 Oct 2024 10:28:05 +0000
From: Lee Jones <lee@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: pavel@ucw.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	kernel@salutedevices.com, rockosov@gmail.com,
	Alexey Romanov <avromanov@salutedevices.com>
Subject: Re: [PATCH v2] leds: introduce ordered workqueue for leds events
 instead of system_wq
Message-ID: <20241031102805.GF10824@google.com>
References: <20240903223936.21292-1-ddrokosov@salutedevices.com>
 <20240916111733.c5rp4l666rtdz7bt@CAB-WSD-L081021>
 <20240917080412.GB9955@google.com>
 <20241022142248.lzm45fzisrcgtitd@CAB-WSD-L081021>
 <20241029200632.chysrb7teyc7dsrq@CAB-WSD-L081021>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029200632.chysrb7teyc7dsrq@CAB-WSD-L081021>

On Tue, 29 Oct 2024, Dmitry Rokosov wrote:

> Hello Lee,
> 
> Kindly reminder.

It's on the list.  There is no need to contentless pings.

-- 
Lee Jones [李琼斯]

