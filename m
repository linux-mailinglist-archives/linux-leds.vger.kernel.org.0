Return-Path: <linux-leds+bounces-8546-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6ccmA45oKGoCDgMAu9opvQ
	(envelope-from <linux-leds+bounces-8546-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 21:25:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51208663A38
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 21:25:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=UbF7LTy8;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8546-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8546-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28122318B88E
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jun 2026 19:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95BAD4DBD69;
	Tue,  9 Jun 2026 19:14:09 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FCD374A01;
	Tue,  9 Jun 2026 19:14:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781032449; cv=none; b=R6hM7RTlGnLLApwk4xEje7FW1gRXk/YQQavBUxQk78Opp7k7Ze7otvhGkLQ+Yz8aJzB0aswE/28fdkGJkDUVxrNZldm50zPYa3uXXLwtbVnNmOnNnMQfwxHvbQGjdsnHIT/2lUuV+r49aN4gwVxFUy7NMADg8joCBEngi2yOwIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781032449; c=relaxed/simple;
	bh=kHAFo30QUtXvLKXA/8ylRwSsXrZr+2hcR1czMiLOh1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZbPrEM15rVjQEofoZJbzHAzpAYJs3OUF2+taYikiQ+g5ukwlfUfG2t4xgULD79xDtO5ciN7KWUKvPr1Jod2t1WCKvldt3tQUj/4MAXP6w+uvWJrf7UiCR4OEErnuiP4UiIeoIhBLs3T9ygUAO6tNMo2KsL2wJrAOqm0YlIZIzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbF7LTy8; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781032448; x=1812568448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kHAFo30QUtXvLKXA/8ylRwSsXrZr+2hcR1czMiLOh1Y=;
  b=UbF7LTy8m7WW/LvlhvAXZ9AObY8JTPfJ+Xvn8ky4LbJtZJRlHVnQt5A0
   QM1mlXA85wc0O6hnbyvN0m54SaHhZmapG8l9zs08aSjVaHbRcKLtZA9yR
   xM94TT8dKVnRsK1tPAnSkhXq5wAmNqKDoSzfJp2sNVs1cmTFczh8op4gz
   30f9DxrKHUxBbnNzeA0yjh118XaazogzEuGB1jqLYfqZllP1J6hJfu8pf
   f3S06tnipflz/PySyX/cs24ZHQEM0t0jDQurd5YpzDhJ6ZkuKJFVg5Ima
   reLl9IdMd0oAEMwpe+8SLI21mUPJPtfoqUlke2rJ0sVFnef+O/kG+6q0M
   Q==;
X-CSE-ConnectionGUID: zyJKSvvwT9mE176WYT8AeQ==
X-CSE-MsgGUID: KNjmyvbmSZa/tMqZhSRrTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81554897"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81554897"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 12:14:06 -0700
X-CSE-ConnectionGUID: X0qVWR8NQgqGxTo5R+G26A==
X-CSE-MsgGUID: drwEeY1KSoSQ1tXR0KjPlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="243485062"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.162])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 12:14:02 -0700
Date: Tue, 9 Jun 2026 22:13:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v4 07/14] mfd: lm3533: Switch sysfs_create_group() to
 device_add_group()
Message-ID: <aihl9yIqN3adKWLr@ashevche-desk.local>
References: <20260606045738.21050-1-clamor95@gmail.com>
 <20260606045738.21050-8-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606045738.21050-8-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8546-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51208663A38

On Sat, Jun 06, 2026 at 07:57:31AM +0300, Svyatoslav Ryhel wrote:
> Switch from sysfs_create_group() to device_add_group() including device
> managed where appropriate.

This should use .dev_groups member of struct device_driver.

...

> +	ret = devm_device_add_group(&bd->dev, &lm3533_bl_attribute_group);

This will make Greg KH very grumpy. (For the record, original code as well
but it already is in upstream. So, thanks for trying to address this, just
needs a bit more of work.)

> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to create sysfs attributes\n");

-- 
With Best Regards,
Andy Shevchenko



