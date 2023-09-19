Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9D37A6657
	for <lists+linux-leds@lfdr.de>; Tue, 19 Sep 2023 16:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbjISOQp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Sep 2023 10:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbjISOQo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Sep 2023 10:16:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB7D196
        for <linux-leds@vger.kernel.org>; Tue, 19 Sep 2023 07:16:35 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E8BC433C7;
        Tue, 19 Sep 2023 14:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695132994;
        bh=7AIdKcG05QpiAfsf6tDRS2aJWOyI0lTZOsAJyWJmWUQ=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=E3g/ecTb6s0MpuZ64nmycGCvJcVOU0Tz+zZY8J3943XJN2b26dXA7JqrwXSo7puQj
         iYZ2OEPJEbfjoB3+w/qKLzA16coziSOWIzrEOrUvpr6jVET8h1TqblQcdpPtioqJhC
         tzdjGS7YS0QJDYSux3QMHUAwPcbIsvGqBquzberuLYwrIe8+0SblO0dg9A8nsQ0lh9
         6yUcPYyhQmQ9LoKp+YgXPRLxhmxaoko0LZ9rCtMhioKCREnjiwzfQE/JPJ4NTWFW4p
         HByO9t+d42hr0cRZH1Sor8DyEcwUwiOtyUD4xwFi+EW9Fu+ZgL9uTqZaZFDJsP+YJB
         r5kwUDvU7I4nw==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, Da Xue <da@libre.computer>,
        =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
In-Reply-To: <20230918140724.18634-1-kabel@kernel.org>
References: <20230918140724.18634-1-kabel@kernel.org>
Subject: Re: (subset) [PATCH] leds: Drop BUG_ON check for
 LED_COLOR_ID_MULTI
Message-Id: <169513299310.3234548.9496108015469823923.b4-ty@kernel.org>
Date:   Tue, 19 Sep 2023 15:16:33 +0100
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

On Mon, 18 Sep 2023 16:07:24 +0200, Marek Behún wrote:
> Commit c3f853184bed ("leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that
> is always false") fixed a no-op BUG_ON. This turned out to cause a
> regression, since some in-tree device-tree files already use
> LED_COLOR_ID_MULTI.
> 
> Drop the BUG_ON altogether.
> 
> [...]

Applied, thanks!

[1/1] leds: Drop BUG_ON check for LED_COLOR_ID_MULTI
      commit: 9dc1664fab2246bc2c3e9bf2cf21518a857f9b5b

--
Lee Jones [李琼斯]

