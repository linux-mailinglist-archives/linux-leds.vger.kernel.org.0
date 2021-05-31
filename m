Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12311395586
	for <lists+linux-leds@lfdr.de>; Mon, 31 May 2021 08:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhEaGlL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 31 May 2021 02:41:11 -0400
Received: from mga12.intel.com ([192.55.52.136]:11274 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230070AbhEaGlK (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 31 May 2021 02:41:10 -0400
IronPort-SDR: YB9bIFizeqc52j6nImXY+xCt/DKs3MUZAtYM5zju/yQD+mu9LvBTl3ds5UeUPhPGlLP2F6/BNB
 ras5tfCktWbQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="182985561"
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; 
   d="scan'208";a="182985561"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2021 23:39:31 -0700
IronPort-SDR: ONzyII6rn9b0foCDxQEp0z4gpwA/IdW6vucD+W75dQcCoDxJtbeGPi4BPZcQe1PrGtF4o2q6y7
 VA7VQE5tsE7g==
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; 
   d="scan'208";a="478793433"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2021 23:39:29 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 84AAE20130;
        Mon, 31 May 2021 09:39:27 +0300 (EEST)
Date:   Mon, 31 May 2021 09:39:27 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/6] leds: as3645a: Move driver to flash subdirectory
Message-ID: <20210531063927.GS3@paasikivi.fi.intel.com>
References: <20210528202404.431859-1-linus.walleij@linaro.org>
 <20210528202404.431859-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528202404.431859-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 28, 2021 at 10:24:00PM +0200, Linus Walleij wrote:
> We created a subdirectory for LED drivers that depend on
> CONFIG_LEDS_CLASS_FLASH, and this driver does so let's
> move it there.
> 
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks, Linus!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
