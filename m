Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35FF57A998C
	for <lists+linux-leds@lfdr.de>; Thu, 21 Sep 2023 20:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjIUSP4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 21 Sep 2023 14:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbjIUSP1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 21 Sep 2023 14:15:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3629584F24
        for <linux-leds@vger.kernel.org>; Thu, 21 Sep 2023 10:37:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01118C4AF6D;
        Thu, 21 Sep 2023 10:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695293498;
        bh=rH55MFNjDQ/8I7YHhB4kiilVQZ7xNdmDJuvsySbx/yI=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=Q8C39Qq4VlyebbuaKTVCa3ZwRw+o/p9L7vMD68Zope3cZsfDjnpgEaMnENko8Z2J9
         u0VoydC+W8Sd/dbRrKxAn2bxsZhkWk373Q3xmD0GCaCZ+axJEufB0EVszbeOOhYYhO
         u1aj1JSHnEMz+oVDZCvVI5cX6mN6Wq8ecCp5pkXCFz6MeU3h4351s/O3fucGEq1r0E
         5A3+khgvHFOs0FxWOAFNp/CeC7uL5+swIbAKSt0d4E4XbujBDev4g5naE5Lu81tGi0
         hK2+YB1EljYZZlXMRToOaDtkOfsHLYVUCpKmkcUjrLXCnu2nldQoyL2Id/WECEL+ph
         5pSJLY0UBhagQ==
From:   Lee Jones <lee@kernel.org>
To:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
In-Reply-To: <20230918161104.20860-1-kabel@kernel.org>
References: <20230918161104.20860-1-kabel@kernel.org>
Subject: Re: [PATCH v4 0/4] leds: turris-omnia: updates
Message-Id: <169529349771.3611714.16560372288467225688.b4-ty@kernel.org>
Date:   Thu, 21 Sep 2023 11:51:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 18 Sep 2023 18:11:00 +0200, Marek Behún wrote:
> I am sending version 4 of Turris Omnia's LED controller updates.
> I tried to address the issues you mentioned:
> - I made the omnia_cmd_read_raw() function to return the number of read
>   bytes on success
> - I have renamed omnia_cmd_read() to omnia_cmd_read_u8() since it always
>   reads one byte. The function returns the read byte on success and
>   a negative errno on failure
> - accordingly, I have renamed omnia_cmd_write() to omnia_cmd_write_u8(),
>   and made it so that it returns the number of written bytes on success
> - the newly added comments now start with a capital letter
> 
> [...]

Applied, thanks!

[1/4] leds: turris-omnia: do not use SMBUS calls
      commit: 2b423ec3d05b5b9f6e663e99d40314c011a23a41
[2/4] leds: turris-omnia: make set_brightness() more efficient
      commit: aa5799d8cf1958e1359023aa13842952c6fde267
[3/4] leds: turris-omnia: support HW controlled mode via private trigger
      commit: 276f5ece909ee04676c92d4a942354a75059d832
[4/4] leds: turris-omnia: add support for enabling/disabling HW gamma correction
      commit: d82d0db48329785d31e7fed3ead8429383c94127

--
Lee Jones [李琼斯]

