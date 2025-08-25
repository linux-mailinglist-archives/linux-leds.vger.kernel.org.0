Return-Path: <linux-leds+bounces-5307-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1EAB34597
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 17:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42C3F5E445A
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 15:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C3E3002CD;
	Mon, 25 Aug 2025 15:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzjo5/l6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA073002B8;
	Mon, 25 Aug 2025 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756135169; cv=none; b=bbBR0SRVnxpdHZYEaHJ+KWHIB8oS9vN16qa40TmcWhSeTltF5G4uyNOFUF2/meGRlKf46ykjJRj4hezRh0ox4pgdmZzW0gHVC9C2/YacBYzJkLyZvfhVorwYZuQkSxqst8DNrre7j5/1TlYuRVOYmLHiIzX/cx2e9QWa8n3GC7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756135169; c=relaxed/simple;
	bh=MlfYpeciqo6/Q+ncwKrMqzeKFHhsCM2Mf83CW2gpNuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aedNskb4spB8HSLuAslTsMClYI6JFcGOOR6EBOyjInky7/cPVMekJOVTkZCgjyVs+yclliM+7NZ6FLGZIck2j3XEzytZ29We/VD9mCVoehvEBN4ERItzL/jffcSgAccMuC+DqA32hwhQ8X6EoISiSBwhSpL9lNuu0RI5N3bH/rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzjo5/l6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756135168; x=1787671168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MlfYpeciqo6/Q+ncwKrMqzeKFHhsCM2Mf83CW2gpNuI=;
  b=jzjo5/l6/lc8bDPshJ0/6Q1f12EGsrK96rC+ed6691ofZtMLgniSmNMP
   SoHyct7O/JQGb9QUIEIocfS83BnW11mB+Bf39c+IgCnzrA9XjZRkbq2/b
   d99wPR1k4Esl++/eu7jrD4zeto4vVxs16dwwaIHVfJ+WSH4QCvO2LPqUu
   742zh7GzvvEP8AF7/hAnOtVvMyRsAZr7dW499cDhKe983kvl3+AYsMpDo
   3/LkBL34M99yogilaO39EtCWZpI7Nx3A0qsZQFhqv0Wkdpg02XOfHdauO
   lDSUg8NTKW/lAHj986zcb6ZL1dxtjMqH+F1F/qSoCP7YUfvONrfpOsryJ
   Q==;
X-CSE-ConnectionGUID: yo/3UJKlQlCk0JL5EHWw/g==
X-CSE-MsgGUID: YkSqVu7/SnWzv6oSV1/BBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58213213"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="58213213"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 08:19:27 -0700
X-CSE-ConnectionGUID: TsSJKLBLRyecsuQXj+8LcQ==
X-CSE-MsgGUID: keidpHPDQgG1YYldulWogA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="206485561"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 08:19:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uqYyf-00000008Xn4-3oYL;
	Mon, 25 Aug 2025 18:19:21 +0300
Date: Mon, 25 Aug 2025 18:19:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 6/6] auxdisplay: TM16xx: Add support for SPI-based
 controllers
Message-ID: <aKx--dksx6-WUOp8@smile.fi.intel.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com>
 <20250825033237.60143-7-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825033237.60143-7-jefflessard3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Aug 24, 2025 at 11:32:32PM -0400, Jean-François Lessard wrote:
> Add support for TM16xx-compatible auxiliary display controllers connected
> via the SPI bus.
> 
> The implementation includes:
> - SPI driver registration and initialization
> - Probe/remove logic for SPI devices
> - Controller-specific handling and communication sequences
> - Integration with the TM16xx core driver for common functionality
> 
> This allows platforms using TM16xx or compatible controllers over SPI to be
> managed by the TM16xx driver infrastructure.
> 
> Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
> ---

> Notes:
>     include <linux/of.h> is required for of_match_ptr

Yeah, please drop the latter and remove the former.

All other comments are the same as per I²C counterpart of the driver.

-- 
With Best Regards,
Andy Shevchenko



