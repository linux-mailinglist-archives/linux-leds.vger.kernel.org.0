Return-Path: <linux-leds+bounces-5093-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CF3B09C31
	for <lists+linux-leds@lfdr.de>; Fri, 18 Jul 2025 09:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F3A23ACA2A
	for <lists+linux-leds@lfdr.de>; Fri, 18 Jul 2025 07:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF001E25E8;
	Fri, 18 Jul 2025 07:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APPixPty"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38E811CAF;
	Fri, 18 Jul 2025 07:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752822988; cv=none; b=bLoQ1llMKVjtT0qacBfXShKHCwcLq6qqRp4xb28p4pXNaJ/Ig9q/FK825ROhKpiBmTlZ99DaYn2Ohkv4yTmF8e1I2d5BJEsewZHZLIbG1d+AifDRMPDe3umh9eztFd9phQUjo/wDCicjMrplmgqc/xfdzIYuVfX35sIcbs+EuE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752822988; c=relaxed/simple;
	bh=Lge0NYoif5nduRoA5W6c1yvWLXuJuaMaklUH0UN7kVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZOw4lDHvw35L6q+QNIL5Yn3XoVvWgd5GsACo510axHEiqTtZihoiKQqkXfI76NaiM5PQ0fexRtw5IWOX47NuGvD1X/uCKSlmZnw9qariYWGBJNvHFV+aOGiiK/VZYbVmZidwJUsgC+fQcxU2ftNKJ4G6Ldt07Nq5FZKOBIzYNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APPixPty; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60F4C4CEED;
	Fri, 18 Jul 2025 07:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752822987;
	bh=Lge0NYoif5nduRoA5W6c1yvWLXuJuaMaklUH0UN7kVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APPixPty1AKa3jggu5DmHwWzFjk4Aw8XCzbc7r+Zt91ghlSphQWWgMxTb4lJKsIjp
	 tPyJzSP1hQtgW3c7/W0IIiRA8DFUvt6jWXWBK2vTvrVBV0zHwJ/dvQW0yxvljhdkl0
	 k4b1tBlU9Dhx01woCdMZupkJaU95cPlfowpMUUX1+xRgFLvndkGYiJ6a0BAdqxoNFS
	 NfF55YbX4bDNFm5dRnRJgdwNdlSUuj34BlPiGWs+sANtYna/YKGKl/vPXNySvpNWmL
	 gY9OOPAHFryUStT7E9yKZIwgI7nD9WxHb5O1J8o+JBhf40ljmtv1kIq46J06rV6C8n
	 GYJttDb3syDpQ==
Date: Fri, 18 Jul 2025 09:16:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Lucca Fachinetti <luccafachinetti@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: leds: is31fl32xx: convert the
 binding to yaml
Message-ID: <20250718-dangerous-smart-guppy-b8aa74@kuoka>
References: <20250717-leds-is31fl3236a-v4-0-72ef946bfbc8@thegoodpenguin.co.uk>
 <20250717-leds-is31fl3236a-v4-1-72ef946bfbc8@thegoodpenguin.co.uk>
 <175277045533.3779995.9523277801474945480.robh@kernel.org>
 <CAA6zWZLyUt9X4+dAgYBVGqdNchasJorWhNH1O1Ti=UBO-J6q9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAA6zWZLyUt9X4+dAgYBVGqdNchasJorWhNH1O1Ti=UBO-J6q9g@mail.gmail.com>

On Fri, Jul 18, 2025 at 07:50:51AM +0100, Pawel Zalewski wrote:
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date
> 
> Hmm interesting, I did run it, have yamlint installed and see no
> errors. Will upgrade dtschema and try again.

Are you sure you tested patch #1 only?

Best regards,
Krzysztof


