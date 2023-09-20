Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01F357A83D5
	for <lists+linux-leds@lfdr.de>; Wed, 20 Sep 2023 15:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234565AbjITNtq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 20 Sep 2023 09:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234759AbjITNtj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 20 Sep 2023 09:49:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F1CAD
        for <linux-leds@vger.kernel.org>; Wed, 20 Sep 2023 06:49:32 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944C0C433C8;
        Wed, 20 Sep 2023 13:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695217772;
        bh=OclZLGT1lJkSEGIHeCsICnr7gzC5B5UL7xhG3nkNlTg=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=MHUdOLtDlTZP8ByaB627cIlLenNY0Rb46aeOBzHIw7BNny5fAWt6nCznajoekZ1Ct
         Nh3s6F6rEIW5ZXsdrdpMkPNVIcwILoLPeQ4OPqiObMeAITDUd/UEBxn6vDAb+GFP6O
         qbMtns6J40h84pE4l9RRIKs+fxgzT2upCdAogXkiyzkx8Szr549YtCkEeez6POcows
         qu+AAVpnp9KLqrokSh+sOELXW0+PS8TbHFh0VojQuOBqvTUyl7NsKpOCMQK8qMAJ3r
         Yl1QA5/d7Clb8MVVclf0xB+k9HQlsBllzqeFTpv9i5k3JMa7LbJNvTYUqdDk2emzUf
         Vibm8K93YJkwA==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
In-Reply-To: <20230917130947.1122198-1-u.kleine-koenig@pengutronix.de>
References: <20230917130947.1122198-1-u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH] leds: Convert all platform drivers to return
 void
Message-Id: <169521777137.3448172.11404661639582612036.b4-ty@kernel.org>
Date:   Wed, 20 Sep 2023 14:49:31 +0100
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

On Sun, 17 Sep 2023 15:09:47 +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> [...]

Applied, thanks!

[1/1] leds: Convert all platform drivers to return void
      commit: 1bb7500cbe756484c3091e7f56171d4141e860ac

--
Lee Jones [李琼斯]

