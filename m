Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4443135C508
	for <lists+linux-leds@lfdr.de>; Mon, 12 Apr 2021 13:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238974AbhDLL0D (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 12 Apr 2021 07:26:03 -0400
Received: from mga09.intel.com ([134.134.136.24]:6805 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237626AbhDLL0C (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 12 Apr 2021 07:26:02 -0400
IronPort-SDR: i73jeRZSnCaVIgLuFgCos4tDrB0iuZHH6XstpoV2MqYeuTLDB8DiKoO0avwSnMc7rKv5sCGK9b
 cl/CLiNDPvLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="194281033"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="194281033"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 04:25:42 -0700
IronPort-SDR: niJ3U8khfc0yIwNri7iVLFqzyHDmHD0X/RThzsc6BfIhm5vA9AHoCvUHYrKR2zkmYLJ0f9LwOV
 PVmvsIJSaFZQ==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="398328527"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 04:25:41 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lVuhG-003RFi-Jv; Mon, 12 Apr 2021 14:25:38 +0300
Date:   Mon, 12 Apr 2021 14:25:38 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v1 1/1] leds: as3645a: Keep fwnode reference count
 balanced
Message-ID: <YHQuMge3287sa7mp@smile.fi.intel.com>
References: <20210412103838.2055499-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412103838.2055499-1-andy.shevchenko@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Apr 12, 2021 at 01:38:38PM +0300, Andy Shevchenko wrote:
> The commit 88b7e9ffe594 ("leds: as3645a: Switch to fwnode property API")
> missed the point that loop counter should be put after use. Otherwise
> the reference count of it will become unbalanced.

Scratch this, I might be not slept enough.

-- 
With Best Regards,
Andy Shevchenko


