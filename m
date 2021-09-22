Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085E841480F
	for <lists+linux-leds@lfdr.de>; Wed, 22 Sep 2021 13:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235820AbhIVLnj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Sep 2021 07:43:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:48734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235730AbhIVLni (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 22 Sep 2021 07:43:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D7D260FA0;
        Wed, 22 Sep 2021 11:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632310928;
        bh=pjlLJSjohoSWW5Y19/8+O19DYOideKUvpegQ1RgTsdU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s2suzoLVTs1ULJjemmdXFcQqqwW+LRMAyv3Xv8pmW3eExHsuNKdnh2HBYlv1nzNjh
         meBtufK1fUNO+1ytk0qztCxze16Cx0Vkc5SYijxj+IJeUmXErhRX6wkB1wqslGMzdu
         ZFhQm8RlTscKdGnu8+gvNxxpjcZWXVMjMEcSVKpw=
Date:   Wed, 22 Sep 2021 13:42:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>, linux-doc@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        geert+renesas@glider.be, Max.Merchel@tq-group.com,
        linux@rempel-privat.de, daniel@0x0f.com, shawnguo@kernel.org,
        sam@ravnborg.org, arnd@arndb.de, krzysztof.kozlowski@canonical.com,
        pavo.banicevic@sartura.hr, corbet@lwn.net, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        robert.marko@sartura.hr
Subject: Re: [PATCH v9 2/7] drivers: mfd: Add a driver for IEI WT61P803
 PUZZLE MCU
Message-ID: <YUsWjUWBwW8OYBAr@kroah.com>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
 <20210824124438.14519-3-luka.kovacic@sartura.hr>
 <YUsLfZrnX2hq4FGV@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUsLfZrnX2hq4FGV@google.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Sep 22, 2021 at 11:54:53AM +0100, Lee Jones wrote:
> Greg,
> 
> Would you be kind enough to take a look at the SYS imp. please?

/me hands Lee some extra characters...

done.

greg k-h
