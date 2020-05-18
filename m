Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 890F61D8A88
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2020 00:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgERWOi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 May 2020 18:14:38 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:46983 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgERWOi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 May 2020 18:14:38 -0400
Received: by mail-il1-f193.google.com with SMTP id w18so11450060ilm.13;
        Mon, 18 May 2020 15:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EILzSJQ9ooYrSwPtQmh1JCJ6iFHH9cshXd0l+K0UWUg=;
        b=nitLYRi2DhE+3ScFShOd22mpPlAvagEKFcVCY/nPk7rnc/h5YIRIk8dJjLTRA8wmVt
         mESqCWMznttR2dw6nPqvXZ92eCmLzzxeeylWpzVnT7JomjksCcIjxLiJGRx7iUzhFiNa
         kXnKBekKDyCylo3/QZ+A5m/IHvQb/ARptFVLVIfoM0cQ04ubABDh9AC+lTKNjUw3UgRq
         qC5xuEu9ypmEOntz13s76m6t10J2oBoEQxiYq8Tb8FKRsr3J+2NsJzGICaH2nI1Z601t
         RrDCWkjN3loMkgBeJPinrHqCfOz7MbtO/o+UwOcACLrHT7zVtwJLnZxm6g7YYbJd+g/1
         yMEw==
X-Gm-Message-State: AOAM532RsnHJzoVa9qnxHQPHVtrT98ob0CIpbCu9bbez+4irsx0xJPL8
        Dk5M1WV/h7YS6/7U1olk9w==
X-Google-Smtp-Source: ABdhPJxuDsDG4Q8cCZyp7eSxhiTFEEoCp3gbOuCrmvr18ODcvv037EWI9zIgOwCOuRr5OAWDWsrAAA==
X-Received: by 2002:a92:5f5a:: with SMTP id t87mr18582791ilb.269.1589840077379;
        Mon, 18 May 2020 15:14:37 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id r80sm5316136ilk.65.2020.05.18.15.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 15:14:36 -0700 (PDT)
Received: (nullmailer pid 6875 invoked by uid 1000);
        Mon, 18 May 2020 22:14:35 -0000
Date:   Mon, 18 May 2020 16:14:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     nikitos.tr@gmail.com
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Shanghai Awinic
 Technology Co., Ltd.
Message-ID: <20200518221435.GA6734@bogus>
References: <20200511111128.16210-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511111128.16210-1-nikitos.tr@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 11 May 2020 16:11:26 +0500,  wrote:
> From: Nikita Travkin <nikitos.tr@gmail.com>
> 
> Add the "awinic" vendor prefix for Shanghai Awinic Technology Co., Ltd.
> Website: https://www.awinic.com/
> 
> Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
