Return-Path: <linux-leds+bounces-6472-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A56CE55C4
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 19:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A1C530052E1
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 18:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AC5239086;
	Sun, 28 Dec 2025 18:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XE46Y4dy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BFA21B9C5;
	Sun, 28 Dec 2025 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766946955; cv=none; b=Z1CCCrGGAN7Y/68mP6K4gzGbpdMLy2fvMoOCSQaNeDhlY1lYTkVHs8ODHZXsTnLVB9/ZQ0bkNO1Km64PWxTLj01K2ea29ZJ3EPE/ogq3Hny0vwdXZgpOkU94mbdTR6nUITFFrJougXkAWq0HeTCymrzsiM+q5cI3rrlhjsVc7CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766946955; c=relaxed/simple;
	bh=GR78x3FjstOlwgULim1/NTXkBuzt2of9dG/FyuDNxmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nq2/ySatUUdmooVOEhRtoZZq5U4gSPiQYNmQuz4zJVPXlKoPO3KRWM3KrRnwxc3On5dC+fbe8ElTpGFL1YXc9p9Dam/uJB5PUAGfOkiGAIlgqiH9w6qOq4ghbzkhn7f32DaspR81BxM3j0Y0GBKoxUygR7Hept8Tr9GxkJZVDz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XE46Y4dy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766946953; x=1798482953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GR78x3FjstOlwgULim1/NTXkBuzt2of9dG/FyuDNxmM=;
  b=XE46Y4dyBjI7NzasF+xH78gBzezkRUnfNVpXTh5W1ihWAnqGfJcUWv5j
   8NYpOyhdjCULYl4Y64ug8aiV5OX6TXUhohGJmei2wJcBDhv9mIElZcvqH
   F0K9uh0A80TY1Br/E0oHdA/uF/q1ktYLHpl+mTIVjpHHDHMDQFKZN7Ovw
   VHH/ft9R+RacZGJtqttyimC6GHk51BPigAejqVC7aYV+ID3w/zWrsTA8K
   uHJLJclLKYboLnCsnVVR5/UKXGyPfFGCvyllp90F+bEzURdsgMiANQpf5
   rd3mEuX1B5lbeCkm1YmZhKtcEF22UvrXranoLd+qpOiIJA7eOnstSFW5F
   A==;
X-CSE-ConnectionGUID: +Ru6m52JQ2qo0UM3lyA/JA==
X-CSE-MsgGUID: DQV1D3XzQiOLeOx+DcBEsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="67786165"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="67786165"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 10:35:53 -0800
X-CSE-ConnectionGUID: Ha0tMjk+QcuOmCIQYsOuTw==
X-CSE-MsgGUID: /B6tG/6hT+KhoHpDFnefzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="205798712"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 10:35:49 -0800
Date: Sun, 28 Dec 2025 20:35:47 +0200
From: Andriy Shevencho <andriy.shevchenko@linux.intel.com>
To: Jonathan Brophy <professorjonny98@gmail.com>
Cc: lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] leds: core: Add support for led-instance property
Message-ID: <aVF4g_W2KHQ53gbJ@smile.fi.intel.com>
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
 <20251228182252.1550173-2-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228182252.1550173-2-professorjonny98@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Dec 29, 2025 at 07:22:44AM +1300, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> Add support for parsing an optional "led-instance" device tree property
> that provides a third component in LED naming for deterministic
> identification when multiple LEDs share the same function and color.
> 
> The led-instance becomes part of the LED name as:
>   color:function:instance
> 
> This solves the non-deterministic _1, _2 suffix problem for hardware
> with many identical LEDs (e.g., 48-port network switches).

> +parse_instance:
> +	/* Parse optional instance identifier */
> +	if (fwnode_property_present(fwnode, "led-instance")) {
> +		ret = fwnode_property_read_string(fwnode, "led-instance", instance);
> +		if (ret)
> +			dev_err(dev, "Error parsing 'led-instance' property (%d)\n", ret);
> +	}
>  }

But this will be called unconditionally even if the
function/function-enumerator is present. Wouldn't these be conflicting options?

-- 
With Best Regards,
Andy Shevchenko



