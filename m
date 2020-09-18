Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC2F26F5CA
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 08:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgIRGPK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Sep 2020 02:15:10 -0400
Received: from mga11.intel.com ([192.55.52.93]:13106 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726022AbgIRGPK (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 18 Sep 2020 02:15:10 -0400
IronPort-SDR: jeDSxMVcU5lko8yRIl+tMleUWk9TFGoWopf+2i56J3WPPi4EYUgXKSv0Gd3e0d6TML0CgAmnLp
 jq5rewbk1o2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="157260707"
X-IronPort-AV: E=Sophos;i="5.77,273,1596524400"; 
   d="scan'208";a="157260707"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 23:15:08 -0700
IronPort-SDR: riPwM3NP52txiavt/pPSqmqhMUVTPj8iAM6ZS9GNMcnm82YEpR68Ab/8u+gJDnWeDjNgydcr7P
 CuQ7HJ4nnvfQ==
X-IronPort-AV: E=Sophos;i="5.77,273,1596524400"; 
   d="scan'208";a="320503919"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 23:15:02 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 444EF20815; Fri, 18 Sep 2020 09:15:00 +0300 (EEST)
Date:   Fri, 18 Sep 2020 09:15:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH leds v2 05/50] leds: various: guard of_match_table member
 value with of_match_ptr
Message-ID: <20200918061500.GD26842@paasikivi.fi.intel.com>
References: <20200917223338.14164-1-marek.behun@nic.cz>
 <20200917223338.14164-6-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200917223338.14164-6-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

On Fri, Sep 18, 2020 at 12:32:53AM +0200, Marek Behún wrote:
> Change
>   .of_match_table = xxx,
> to
>   .of_match_table = of_match_ptr(xxx),
> in various drivers.
> 
> This should be standard even for drivers that depend on OF.

After this patch, none of these drivers will work on ACPI systems anymore.

How many of them really depend on OF?

-- 
Regards,

Sakari Ailus
