Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2549126F9BC
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 11:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgIRJ6j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Sep 2020 05:58:39 -0400
Received: from mga01.intel.com ([192.55.52.88]:8132 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbgIRJ6i (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 18 Sep 2020 05:58:38 -0400
IronPort-SDR: xo7Dkotoieh324yOb8EuIfQaISSC1ppYU+XGhLu6dFrNZNBcBM6u4MgIhqLnxuNJPhGoUsqKbl
 WXQR9QZDkSrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="177994163"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="177994163"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 02:58:37 -0700
IronPort-SDR: DM20wbBrmnoRBgQ0MDZp4J4CXwPRFPXD8sJB+wqEsS0O65H4KHh/Oe1K/7Yo0CyhbYM2YRrZpa
 jAH1COn3YC4Q==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="344694904"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 02:58:31 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id DD46A20815; Fri, 18 Sep 2020 12:57:59 +0300 (EEST)
Date:   Fri, 18 Sep 2020 12:57:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marek Behun <marek.behun@nic.cz>
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
Message-ID: <20200918095759.GG26842@paasikivi.fi.intel.com>
References: <20200917223338.14164-1-marek.behun@nic.cz>
 <20200917223338.14164-6-marek.behun@nic.cz>
 <20200918061500.GD26842@paasikivi.fi.intel.com>
 <20200918112058.6d3b0d5d@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200918112058.6d3b0d5d@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Sep 18, 2020 at 11:20:58AM +0200, Marek Behun wrote:
> On Fri, 18 Sep 2020 09:15:00 +0300
> Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> 
> > Hi Marek,
> > 
> > On Fri, Sep 18, 2020 at 12:32:53AM +0200, Marek Behún wrote:
> > > Change
> > >   .of_match_table = xxx,
> > > to
> > >   .of_match_table = of_match_ptr(xxx),
> > > in various drivers.
> > > 
> > > This should be standard even for drivers that depend on OF.  
> > 
> > After this patch, none of these drivers will work on ACPI systems anymore.

^

If CONFIG_OF is disabled, that is.

> 
> Hi Sakari,
> 
> I don't understand. Why not? Does ACPI subsystem parse of_match_table
> as well?

It does. The compatible string is used the same way as in DT for matching
devices with "PRP0001" _HID or _CID.

Please read Documentation/firmware-guide/acpi/enumeration.rst .

IOW, you can safely do the above only for drivers that depend on OF in
Kconfig. Otherwise you'll probably break something.

-- 
Sakari Ailus
