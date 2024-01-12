Return-Path: <linux-leds+bounces-594-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB82382BC15
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jan 2024 08:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DEE71C212A5
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jan 2024 07:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C92B5D738;
	Fri, 12 Jan 2024 07:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlSSTgcn"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAEB1399;
	Fri, 12 Jan 2024 07:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F9CC433C7;
	Fri, 12 Jan 2024 07:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705046140;
	bh=aJ+VrNeLW42j009MroRs6oauVxKxbavikHEikZnEQ8M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=UlSSTgcnFNXyOpXctVv9UzYpg4nwjGY8wuT6XH71jkVyor53Z7EBHZSell/OicGvu
	 NNLP+fppMlh6Kt9bqjlmsxqJ5ZtpST+MpAuogUvyfCoISbycK18O57bpT5/yQJm4lK
	 2dwIx4sIGbN0n/crbHFCVMrrO58jXlnofQMdAg32/l0LZEgAW4zqB8wnnvN2Jlb2lo
	 hDTu2LczsaC/bueYF1XqTDG2+I+EpeYz/XjhX4w9RBvFWXTuB7TtatqcroLAQ+98UR
	 AKtvPbgt/ISCKpP6keV9Px/wvb8k4j/+5V7PTDl+nABf6d4j593klefGct05pnJNBd
	 4Emouq1MItLHQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Daniel Golle <daniel@makrotopia.org>, 
 "David S. Miller" <davem@davemloft.net>, Li Zetao <lizetao1@huawei.com>, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20240111160501.1774-1-ansuelsmth@gmail.com>
References: <20240111160501.1774-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v7 1/2] leds: trigger: netdev: display only supported
 link speed attribute
Message-Id: <170504613854.2144661.13464069830148359023.b4-ty@kernel.org>
Date: Fri, 12 Jan 2024 07:55:38 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Thu, 11 Jan 2024 17:04:54 +0100, Christian Marangi wrote:
> With the addition of more link speed mode to the netdev trigger, it was
> pointed out that there may be a problem with bloating the attribute list
> with modes that won't ever be supported by the trigger as the attached
> device name doesn't support them.
> 
> To clear and address this problem, change the logic where these
> additional trigger modes are listed.
> 
> [...]

Applied, thanks!

[1/2] leds: trigger: netdev: display only supported link speed attribute
      commit: df63b2946f9e6dcad64bf35286d3f738f1f75c02
[2/2] docs: ABI: sysfs-class-led-trigger-netdev: Document now hidable link_*
      commit: 1f88a09c35f8d50eff1adbc9e35cc2982b3ac9f9

--
Lee Jones [李琼斯]


