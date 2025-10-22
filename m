Return-Path: <linux-leds+bounces-5857-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B6FBFD41F
	for <lists+linux-leds@lfdr.de>; Wed, 22 Oct 2025 18:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A05D835842D
	for <lists+linux-leds@lfdr.de>; Wed, 22 Oct 2025 16:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6A4354AEF;
	Wed, 22 Oct 2025 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+kfXMFK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2A1279789;
	Wed, 22 Oct 2025 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150003; cv=none; b=sB66qEs/O2xa7LXHnbKjDlMIGYssWmTbVA9DbjO+YDWnmFNauI5RlksqddBsSF9g5kJaaFi5feKXxnIlz4UzNDkmgNJ64l4lNM387pn1cKIT2z7f1lpYLWei8HSJNGdh370F+/AZ1hXWUG5Okci8A3J2V78Jn/4o6TymyXAS5OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150003; c=relaxed/simple;
	bh=2rpBH3Z2TDWwm6DGdmwsKxKTQftRqWP2IU7YUsOpuoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fp/AJ9IZe6kTVf0hYStJA90PDVhCiHZZTteWj11dAi0N2KQe/bB2pW/XXzYTPTKZZSB2ki6RGkSOB01sInuPTMxND/lO7Sz0rcT4rRRl2QAmDQpn/g5MttfXTIQZKSnVpftdwI4YPzvpk/vBmboFdW5PuNCdBgnbKkZkXmqohV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+kfXMFK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418B3C4CEE7;
	Wed, 22 Oct 2025 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761150003;
	bh=2rpBH3Z2TDWwm6DGdmwsKxKTQftRqWP2IU7YUsOpuoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+kfXMFKK8LZZ+YN/R1gwlZwEoTsimkZLuPcLj4lk+116L1M8dQbubpiKfg9RYVq7
	 ujZ3x6ZP648GC9NC41PgoFTuVqXf930e25kwAOOCEdtoipkFGYTIJzEXTIrGIMpK0d
	 uwWdw/dGcpsQqZTLMvdbADYO73zKWECPWPQjseIIRLf0diiFPFuZI066BABR7wjzjZ
	 4HhAYLDnXLcSH0dKv6yJgF5e9NYHU+3F//gQ5aAWUo2p49XOgvaiZReIkZBa1CkB/E
	 5fqmsFJk7n5J0a1DoylBoXJonOBONJCvYGzlBLcaXfFpjwb1o8EmiZJioBmvKAUWWZ
	 470oeIsJMVGaA==
Date: Wed, 22 Oct 2025 18:19:57 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Jonathan Brophy <professorjonny98@gmail.com>,
	lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 4/4] leds: Add virtualcolor LED group driver
Message-ID: <20251022161957.GA1228040@ax162>
References: <20251019092331.49531-5-professorjonny98@gmail.com>
 <202510201144.TwTDnjSJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202510201144.TwTDnjSJ-lkp@intel.com>

On Mon, Oct 20, 2025 at 11:29:28AM +0800, kernel test robot wrote:
...
> url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Brophy/dt-bindings-Add-virtualcolor-class-dt-bindings-documentation/20251019-172647
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
> patch link:    https://lore.kernel.org/r/20251019092331.49531-5-professorjonny98%40gmail.com
> patch subject: [PATCH v3 4/4] leds: Add virtualcolor LED group driver
> config: i386-randconfig-001-20251020 (https://download.01.org/0day-ci/archive/20251020/202510201144.TwTDnjSJ-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510201144.TwTDnjSJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510201144.TwTDnjSJ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/leds/rgb/leds-group-virtualcolor.c:463:38: warning: cast from 'void (*)(struct mutex *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
>      463 |         ret = devm_add_action_or_reset(dev, (void (*)(void *))mutex_destroy,
>          |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/device/devres.h:166:34: note: expanded from macro 'devm_add_action_or_reset'
>      166 |         __devm_add_action_or_reset(dev, action, data, #action)
>          |                                         ^~~~~~
>    1 warning generated.

This should use a dedicated wrapper function like a patch that I just
sent for the same issue in another driver [1] to avoid a kernel control
flow integrity violation at run time with CONFIG_CFI=y.

[1]: https://lore.kernel.org/20251022-ishtp-fix-function-cast-warn-v1-1-bfb06464f8ca@kernel.org/

Cheers,
Nathan

