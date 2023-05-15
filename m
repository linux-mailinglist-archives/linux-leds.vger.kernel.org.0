Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEA737030FE
	for <lists+linux-leds@lfdr.de>; Mon, 15 May 2023 17:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242136AbjEOPHM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 May 2023 11:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242121AbjEOPHL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 May 2023 11:07:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A2F118
        for <linux-leds@vger.kernel.org>; Mon, 15 May 2023 08:07:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2EB32618A2
        for <linux-leds@vger.kernel.org>; Mon, 15 May 2023 15:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D74EC433D2;
        Mon, 15 May 2023 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684163229;
        bh=YcqKA8VR5eb20UrB7/WIXlLeb4ljA02KfHzUI3UxC7M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S9zcM2CSM7ZwVjxrIZOm5x183mHRlzRuXvCVJ2YSxTPQGXTqDLQN5jKuWpnrkReiQ
         e0lUtUrCVdAXBpb8rCacSKTyaxFj+j3WF4Xr178enDeklVK6t4T+mTAIleXGEWcVHk
         ftd3epPLTOBTDUTcz/sf8Mjvf/YGoaSKD4W4qiJXK0ZUVICJtmZjoNIYjyyxlpUnob
         4Vd0SCpNvM0kt3Z1virQVch0YP5k9TMOXYE1iFToR0rCs8ToTNZUQnP+NUFo8FWXcI
         L9+buDVpVf3kUg5wA//0kOTqCunZVQi+YOzXvSKkaHJUuFZiD59lmeyf/HRiH+4Pi0
         F6omXbjjImZ0A==
Date:   Mon, 15 May 2023 16:07:04 +0100
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 3/5] leds: cht-wcove: Add support for breathing mode
 use hw_pattern sysfs API
Message-ID: <20230515150704.GJ10825@google.com>
References: <20230430195952.862527-1-hdegoede@redhat.com>
 <20230430195952.862527-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230430195952.862527-4-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 30 Apr 2023, Hans de Goede wrote:

> The hw-blinking of the LED controller in the Whiskey Cove PMIC can also
> be used for a hw-breathing effect.
> 
> As discussed during review of v2 of the submission of the new
> leds-cht-wcove driver, the LED subsystem already supports breathing mode
> on several other LED controllers using the hw_pattern interface.
> 
> Implement a pattern_set callback to implement breathing mode modelled
> after the breathing mode supported by the SC27xx breathing light and
> Crane EL15203000 LED drivers. The Whiskey Cove PMIC's breathing mode
> is closer to the EL15203000 one then to the SC27xx one since it does
> not support staying high / low for a specific time, it only supports
> rise and fall times.
> 
> As such the supported hw_pattern and the documentation for this is almost
> a 1:1 copy of the pattern/docs for the EL15203000 breathing mode.
> 
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Link: https://lore.kernel.org/all/6beed61c-1fc6-6525-e873-a8978f5fbffb@gmail.com/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3
> - s/LED_OFF/0/ and s/LED_ON/1/
> 
> Changes in v2
> - Improve/extend Documentation/leds/leds-cht-wcove.rst a bit
> ---
>  Documentation/leds/index.rst          |  1 +
>  Documentation/leds/leds-cht-wcove.rst | 38 ++++++++++++++++++++++++
>  drivers/leds/leds-cht-wcove.c         | 42 ++++++++++++++++++++++++---
>  3 files changed, 77 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/leds/leds-cht-wcove.rst

Applied, thanks

-- 
Lee Jones [李琼斯]
