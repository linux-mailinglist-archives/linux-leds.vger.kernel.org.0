Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93D3470E3F4
	for <lists+linux-leds@lfdr.de>; Tue, 23 May 2023 19:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236914AbjEWRTc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 May 2023 13:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjEWRTb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 May 2023 13:19:31 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC7CCA
        for <linux-leds@vger.kernel.org>; Tue, 23 May 2023 10:19:29 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64d3fbb8c1cso4989b3a.3
        for <linux-leds@vger.kernel.org>; Tue, 23 May 2023 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684862369; x=1687454369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jhdnKxVU8mo4nI5H1oRl197kuHM+g1eNkzJ0cHFJ7RA=;
        b=MwN4DVCBvOHZmSmfLl/EWVYpzBvrJ/gSzhjcK6XTYZKL9AHP073mN4nhk9Ne53vqZg
         kkoBB5B2exsXkiAoCr2Tkjklv0r+MZTNKTOr5e9EwtM5ta5E4CJvKQYohRWPJsY9iSQy
         JRUI1FBciW1TTFujIWCgZh8yDSRTeI1S6EfvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684862369; x=1687454369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhdnKxVU8mo4nI5H1oRl197kuHM+g1eNkzJ0cHFJ7RA=;
        b=fYRxdDIErBQiPR6HsHC9SjWZPDlcUppWo40SQP3kXdjMdNEfbwCZKmyJvwVKaRIwo/
         IEovK/n2oO+YVKS//MmJd3R9efBer0p9fcJRUSHr4bOO0MGV6mXetLjEWSlIi/4zRjRP
         jkSsh1XRCsPoBPG6cI8XjMvyEO8XzpFFP2O0dwvEsv+8Qpus+E3fjuA4+hx71bQ0NDqO
         v+xIc9uAE3T+UtOfatZLgfWseNuueExFnM3GDwErCnsPzlzmV7RihOD1MpG/CBVA6IzN
         PiATM4KPX48YlGKlvXruKnrJz4rb1NmAp5CElOb27Zv7kRFIzWfXNpSIWzKwkZJAFQuy
         /84A==
X-Gm-Message-State: AC+VfDxXb5v/C0ehxR1IMXT5EIeMJGABD3sQmrUm8x2jgpaC4sYs25NX
        P5uOT3O/H61pw1bCyFSPXraxlA==
X-Google-Smtp-Source: ACHHUZ7pYafOwubkexMSJtmC0irXuN1qWSgt5wCCd4SHMKB0SyV2Gr23uvjRKAixTn2lm9hscG6/CQ==
X-Received: by 2002:a05:6a00:804:b0:64d:1e10:5000 with SMTP id m4-20020a056a00080400b0064d1e105000mr20767369pfk.14.1684862368946;
        Tue, 23 May 2023 10:19:28 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d1-20020aa78681000000b0064ccfb73cb8sm6048427pfo.46.2023.05.23.10.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 10:19:28 -0700 (PDT)
Date:   Tue, 23 May 2023 10:19:27 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Azeem Shaikh <azeemshaikh38@gmail.com>
Cc:     Jan-Simon Moeller <jansimon.moeller@gmx.de>,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: blinkm: Replace all non-returning strlcpy with
 strscpy
Message-ID: <202305231019.C6461091@keescook>
References: <20230523021228.2406112-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523021228.2406112-1-azeemshaikh38@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, May 23, 2023 at 02:12:28AM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
