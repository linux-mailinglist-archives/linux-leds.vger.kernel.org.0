Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D33078081F
	for <lists+linux-leds@lfdr.de>; Fri, 18 Aug 2023 11:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348612AbjHRJSh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Aug 2023 05:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359002AbjHRJSN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Aug 2023 05:18:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABEE1FE9
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 02:18:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8040465A40
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 09:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539E4C433C8;
        Fri, 18 Aug 2023 09:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692350290;
        bh=7E0lzMRPsx20LPM/1ugm3zaAOkwEcVre70IqNlGkokc=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=TLpah1AOqonoNLZbPLcJaflvs/sqFTM8zvDHVhDjWfndpedyOa/1Dd4TKh6csI7nr
         mW0CXDO1FR1hmNQdI9nT7ySX8sFvSihdtR1jcJX5KcJshvy1+OYj88dntDPKdLBcHd
         Q+d8qCz+yXlatiMZVVI7rs7+xRWGcy+z4YeBxNCtZT/qv0Bjkyj8V71NZlizHl1BcD
         S3ezCUYIEPd7P6s93Y+14YtzCOCb94bMbg9L8QY1g1D7TN6/n4wfFckYTMOcw2hTPU
         LGySxqlVMLBFe1kkIRTvE98Mrv/59xhZbLPe5LAoKjrFlNUVL5eQ9XBdEJfC2sOai2
         XLZPysl+ZyvXg==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org,
        =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
In-Reply-To: <20230802160748.11208-4-kabel@kernel.org>
References: <20230802160748.11208-1-kabel@kernel.org>
 <20230802160748.11208-4-kabel@kernel.org>
Subject: Re: (subset) [PATCH v3 3/6] leds: turris-omnia: use sysfs_emit()
 instead of sprintf()
Message-Id: <169235028872.1206958.17553627119196663823.b4-ty@kernel.org>
Date:   Fri, 18 Aug 2023 10:18:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 02 Aug 2023 18:07:45 +0200, Marek Behún wrote:
> Use the dedicated sysfs_emit() function instead of sprintf() in sysfs
> attribute accessor brightness_show().
> 
> 

Applied, thanks!

[3/6] leds: turris-omnia: use sysfs_emit() instead of sprintf()
      commit: 72a29725b6f2577fa447ca9059cdcd17100043b4

--
Lee Jones [李琼斯]

