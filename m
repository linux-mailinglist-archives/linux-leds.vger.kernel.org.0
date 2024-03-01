Return-Path: <linux-leds+bounces-1088-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C45D86DFBC
	for <lists+linux-leds@lfdr.de>; Fri,  1 Mar 2024 11:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC067B21364
	for <lists+linux-leds@lfdr.de>; Fri,  1 Mar 2024 10:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734E46BFC2;
	Fri,  1 Mar 2024 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HmXGubFS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E536BFAB;
	Fri,  1 Mar 2024 10:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709290743; cv=none; b=EZfHHLH7XxFfOVcrHYAYVmWJjjgAurMHOMYbru5U+DAUppq2DxUbqxLbwWW856H3ScahaM0kwPs8agfyNw8sR3xipeUXRsjoDH9inQoDJbHmqV2Rtj8p9mucvbXHru3/buR0cF/cnms1Jx/H2Rt40LN3fKWAVatfYCAltXmr3OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709290743; c=relaxed/simple;
	bh=yAJzs4KA4xt5XEEcr45N6D+9gL23NgKwZtsw5g0yegU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=anbvWP5HdoJbcIhQdUFFbNct9UUFQ3Ir1xh3jzr49OSZEgKJIAKKJfn7A9FqINZ2PQG1QnJX8bVD2Sj+ofyyZOi7oL7uxCDEADdq+i/jir2l7/B+q97FAPzAk3kBllXajMSAbxNgfvXoyK9DamV3WiLicuUYrVxTAPF1mvq0cr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HmXGubFS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709290742; x=1740826742;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=yAJzs4KA4xt5XEEcr45N6D+9gL23NgKwZtsw5g0yegU=;
  b=HmXGubFSH0c/EyJpGwMTwI4jVJMQC1ovw3HiH5vBaFTRGbehVI6ujIEV
   elRFVM6ATdNLC/gUozbXcQBWu+i6QZwwi5vdNeSw8tfKIAkeMBGRGQpvk
   /L1JFKWXP3NVQjwE/yqvAABh6hvV9XQk+dHZIHPZJ+LWhWpLyxpaewfTy
   I9JjkIEV9FMxiOhlfw0YRABB3XzRiwDk6y7zc9RtvQKhfgPlxiGZaGTih
   viixfLZOuifH2Eje6nczTTNNM1Df6PEAVGJuvGXmNKmWX8SwC1LF0JgGt
   yQ47wUB5fUXUosKYtEMdlAbdyssKviMIqdC9gOx+5yZ3IG2+ZQAadmnGv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="15255649"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="15255649"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 02:59:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="39179382"
Received: from ybaron-mobl.ger.corp.intel.com (HELO localhost) ([10.94.249.66])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 02:58:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 1 Mar 2024 12:58:53 +0200 (EET)
To: Kate Hsuan <hpa@redhat.com>
cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
    linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hdegoede@redhat.com>, 
    =?ISO-8859-15?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>
Subject: Re: [PATCH v3 2/2] leds: rgb: leds-ktd202x: Get device properties
 through fwnode to support ACPI
In-Reply-To: <20240301033612.11826-3-hpa@redhat.com>
Message-ID: <7dc47181-af26-6d46-d34f-57be0fdc8421@linux.intel.com>
References: <20240301033612.11826-1-hpa@redhat.com> <20240301033612.11826-3-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 Mar 2024, Kate Hsuan wrote:

> This LED controller also installed on a Xiaomi pad2 and it is a x86
> platform. The original driver is based on device tree and can't be
> used for this ACPI based system. This patch migrated the driver to
> use fwnode to access the properties. Moreover, the fwnode API
> supports device tree so this work won't effect the original
> implementations.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

> @@ -568,6 +574,8 @@ static int ktd202x_probe(struct i2c_client *client)
>  		return ret;
>  	}
>  
> +	chip->num_leds = (int) (unsigned long)i2c_get_match_data(client);

Casting twice.

-- 
 i.


