Return-Path: <linux-leds+bounces-5304-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11087B3424F
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 15:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01D8217FFC2
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 13:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220852D238C;
	Mon, 25 Aug 2025 13:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdjqK4Gv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE43421CC61;
	Mon, 25 Aug 2025 13:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756130028; cv=none; b=pnv8SCxqY4gltZR8BhQBa9uyydyJDmIV7SD3s6hPFioKnVTEYX01nzVtnlMWQp/BVG5H+gnzjXOswwqxxME20qCVbkEVsBdMRkKozOuLgdvsSrsEcxosmRhXgfWC/SLwjavcjM1qhYgK842ouHfi31JQUU/r6rHwTU4vBivZYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756130028; c=relaxed/simple;
	bh=kVflB8bWVssgQOi4ERCxNJbmke14NUdaMUMF41ZCnbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQVOnTtOw1c80e/ceckB9HzGQyV3oBlsNwwjHdtP9kAH8Fqt9vjQdULxsKu7KepofZ7H6Yhy8/Hfzm5D11R5r1xDw2NT58IJy1WDoWwwF2YDlyTPH5Bgh/FRMe4ZJzqYCPLXzYztpkoN/Ebqsf3qYfDpZOErDYZpdnpwski/EnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdjqK4Gv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756130026; x=1787666026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kVflB8bWVssgQOi4ERCxNJbmke14NUdaMUMF41ZCnbA=;
  b=jdjqK4GvT9ZN/K2yMuS4VuBDGDzSCK/RiIgBYwRuN5s4uvHIMRjZoh9J
   46JM4PcGLYGEqubdOlsFoyVxpLaPc9tccTCENGeaBlH3dZvFD/2HD2YK6
   uxYT1yeJfmRnfKAhEJHAU1LKaDEzVwk+/IWiSGI+Ds01uN+HP3axD6mgK
   Fth+2emhxghe4+FW0bOyhU1zYsUjof21p5uYzGcD0OCMR+UipW/vee4iX
   UpTEDgLsCM20nfoSqkS3Tf3da4eqTTlRp2aM6dDEm+S7pBcPVUle+IlIJ
   EbhRIE0IHvz+Fu4zctXjwCVvmbPY9T7/Muv4nX3taNji40csYV19Yj2t+
   A==;
X-CSE-ConnectionGUID: havbYWaoRLO9iAZfLk4YxQ==
X-CSE-MsgGUID: gEpeWXMJQjKVj4OLn8bwDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69057243"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="69057243"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 06:53:45 -0700
X-CSE-ConnectionGUID: HkFP3dUzSoWmiV3a8Lt9vQ==
X-CSE-MsgGUID: K03NZA2oQbeYc9sVnOxssw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="173485457"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 06:53:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uqXdi-00000008WYq-3YG6;
	Mon, 25 Aug 2025 16:53:38 +0300
Date: Mon, 25 Aug 2025 16:53:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: vendor-prefixes: Add fdhisi,
 titanmec, princeton, winrise, wxicore
Message-ID: <aKxq4ngaMDxBdMh7@smile.fi.intel.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com>
 <20250825033237.60143-2-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825033237.60143-2-jefflessard3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Aug 24, 2025 at 11:32:27PM -0400, Jean-François Lessard wrote:
> Add vendor prefixes of chip manufacturers supported by the TM16xx 7-segment
> LED matrix display controllers driver:
> - fdhisi: Fuzhou Fuda Hisi Microelectronics Co., Ltd.
> - titanmec: Shenzhen Titan Micro Electronics Co., Ltd.
> - princeton: Princeton Technology Corp.
> - winrise: Shenzhen Winrise Technology Co., Ltd.
> - wxicore: Wuxi i-Core Electronics Co., Ltd.
> 
> The titanmec prefix is based on the company's domain name titanmec.com.
> The remaining prefixes are based on company names, as these manufacturers
> either lack active .com domains or their .com domains are occupied by
> unrelated businesses.
> 
> The fdhisi and titanmec prefixes were originally identified by
> Andreas Färber.

...

> CC: Andreas Färber <afaerber@suse.de>

Not a big issue in _this_ case, but I would suggest to keep the Cc: list after
the '---' line. This will have same effect except being removed from the commit
messages where it would be an unneeded noise. The actual list will be available
via lore archive in emails.

-- 
With Best Regards,
Andy Shevchenko



