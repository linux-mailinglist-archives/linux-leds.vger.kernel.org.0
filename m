Return-Path: <linux-leds+bounces-401-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B2081320D
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 14:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BC7728305A
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 13:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1E456B6B;
	Thu, 14 Dec 2023 13:47:33 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B297137;
	Thu, 14 Dec 2023 05:47:30 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="426251469"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="426251469"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 05:47:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1105719674"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1105719674"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 05:47:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1rDm3d-00000005r64-20mK;
	Thu, 14 Dec 2023 15:47:21 +0200
Date: Thu, 14 Dec 2023 15:47:21 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: George Stark <gnstark@salutedevices.com>
Cc: Nikita Travkin <nikita@trvn.ru>, pavel@ucw.cz, lee@kernel.org,
	vadimp@nvidia.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, hdegoede@redhat.com,
	mazziesaccount@gmail.com, peterz@infradead.org, mingo@redhat.com,
	will@kernel.org, longman@redhat.com, boqun.feng@gmail.com,
	nikitos.tr@gmail.com, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kernel@salutedevices.com
Subject: Re: [PATCH v3 04/11] leds: aw2013: use devm API to cleanup module's
 resources
Message-ID: <ZXsHaXOHs5qlKt9g@smile.fi.intel.com>
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-5-gnstark@salutedevices.com>
 <c709e0f33da06db40127f3a0adcbebbd@trvn.ru>
 <fa048fec-86f2-42b5-ad36-7776c569a349@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa048fec-86f2-42b5-ad36-7776c569a349@salutedevices.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 14, 2023 at 03:58:56PM +0300, George Stark wrote:
> On 12/14/23 08:42, Nikita Travkin wrote:
> > George Stark писал(а) 14.12.2023 03:30:

...

> > Btw, seems like (5..11)/11 never arrived to the lists...
> 
> Yeah there was a delay, but now all patches from series #3 are online.

Nikita is right. This patch was the last in the mailing lists. Fix your mail
gateways, it quite likely the mail server in your organisation filters out
some mails as spam or so. I highly recommend to escalate this with your IT
department.

-- 
With Best Regards,
Andy Shevchenko



