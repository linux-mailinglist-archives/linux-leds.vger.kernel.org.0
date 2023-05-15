Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80231703101
	for <lists+linux-leds@lfdr.de>; Mon, 15 May 2023 17:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242058AbjEOPHk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 May 2023 11:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242121AbjEOPHj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 May 2023 11:07:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8151E118
        for <linux-leds@vger.kernel.org>; Mon, 15 May 2023 08:07:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 12C76618A2
        for <linux-leds@vger.kernel.org>; Mon, 15 May 2023 15:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B5AC433A0;
        Mon, 15 May 2023 15:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684163249;
        bh=XTSww9mTyHnJ8wFGzUhGaAO0c/JjmXY/7WErwEXbuRc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SCqZJitUGdpCXsiyB9VZLDSA7mSuOzH5zym4lo10Zwv7wuNT2J55aCG7jLjvtgez1
         vh1SCLM3U4b7N8YHzeTJJrqg8GZWAHzvOjo+p0MXt+d6jJ8gR2Phyn0MBBnRdxCmou
         159a50nXTKSJ5dD4DWi9NC5NFejIQ5ql5XS5dGahgeIwyUiOIgbhTQMU1A07fn7Gx/
         Aoh2NyYHkpFY6J0aAQlmrwUCa+Yqk8GM1UwhHfFPAUecaqSlAXkdp4U01aR+sDN72D
         KjTOdNdILmoaI7hxfqnhFubORe/KN9xjqT6+eolfTf2GeGw/CoGgTfM/P6RstWCSf9
         K6/Jy62NINrKw==
Date:   Mon, 15 May 2023 16:07:25 +0100
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 4/5] leds: cht-wcove: Set default trigger for charging
 LED
Message-ID: <20230515150725.GK10825@google.com>
References: <20230430195952.862527-1-hdegoede@redhat.com>
 <20230430195952.862527-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230430195952.862527-5-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 30 Apr 2023, Hans de Goede wrote:

> Set a default trigger for the charging LED based on the machine-model
> as set by the PMIC MFD driver.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/leds-cht-wcove.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
