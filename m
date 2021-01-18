Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D80E82F9873
	for <lists+linux-leds@lfdr.de>; Mon, 18 Jan 2021 05:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730368AbhARED4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 17 Jan 2021 23:03:56 -0500
Received: from mail-mw2nam10on2068.outbound.protection.outlook.com ([40.107.94.68]:40353
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725816AbhAREDy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 17 Jan 2021 23:03:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/ac3EMd3Tw9mnKKpAyeMHCIAaTnUJcjqSAFcspA+9XgkWhnwx5k/73yelgEdazq04ukV8TgvroEFEAqal0skQtdmRdOJ2Dlvg0AkawqDwVcic9WJdST0V4cK2udI2OPEgavKMIIixBREoJFhAjM67jr9Ff/kd5rf0r6FKdDbfBBTrNGxpjGpZ9PtHA+bmTUxIgYmE0BwDGqW9G7haOUxT5hcX+XF5GsC0S4efWmj3BB4xt7PnQIqKcSpVjYFms1sDTl7WZedTx2jGahtR5ddSH7ri7NralevF+73h5Gya+VMeilTX8kHpqbduPS1rJOS9gvCUkx44G/z3Gqs2cCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqCVGT+KknCKFUz9rdwEIKPFHKlNLwxPpT8N62X5ueE=;
 b=LokxkeheJlYtY3vqlOMhoSZr4g8/7Q7P8MAuvVlkGB1S932M8DLrG3F08U7pI2dkepg7372f3fbsLIPplSJS+NPsxlaHIMmJD7I2Jdv4H2rCvzwxKXbBO9GgkP3LABqPdrj7+4zElXYDqatNTXEiCfQJ2rsHk5j2R9+dfSWTnevyBexq03xfrLZJNF9q2I4NbNwTS+t/SH3pKzkPIqCjzG1OEOM2BVY4bDeskpYPqDbeZdM5X6Xqj5XlUCFmsc3FPEF+/3w6P5ZiCrFj/u36KXLU5rup7guqG9Eoj2GA0vsJF9YlWt+N1p3yQZ3KUyR5GokalP397ywyj/Xk1U37SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqCVGT+KknCKFUz9rdwEIKPFHKlNLwxPpT8N62X5ueE=;
 b=E0EQLSxnrqS/jnqkj8FDWJrpjUs5vLWQhhH2Lb9veCtehppPl41as/K+20YqcU2IseEgwsKjLHWwUGj3fz29Pcpk6GLuX8mI2w2VWZmVOuEXfrZYMO3/SWWCvEzmUknAJRpbUYYm2iile2EZ4ImSC+r1EdqM8flEkSuuLa/WAQ4=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4941.namprd08.prod.outlook.com (2603:10b6:805:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 04:03:01 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 04:03:00 +0000
Date:   Sun, 17 Jan 2021 22:02:54 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/4] dt-bindings: mfd: Fix schema warnings for pwm-leds
Message-ID: <20210118040254.GA7479@labundy.com>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
 <20210114100312.GL3975472@dell>
 <20210115035050.GA27243@labundy.com>
 <20210115094238.s36rrgmpq63a622p@falbala.internal.home.lespocky.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210115094238.s36rrgmpq63a622p@falbala.internal.home.lespocky.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SN7PR04CA0114.namprd04.prod.outlook.com
 (2603:10b6:806:122::29) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.173.128) by SN7PR04CA0114.namprd04.prod.outlook.com (2603:10b6:806:122::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11 via Frontend Transport; Mon, 18 Jan 2021 04:03:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d51fecd5-7dbe-4b7f-2b97-08d8bb65f273
X-MS-TrafficTypeDiagnostic: SN6PR08MB4941:
X-Microsoft-Antispam-PRVS: <SN6PR08MB49412F2066780C7FF31B56BCD3A40@SN6PR08MB4941.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ks/ZbQxfVEy07TO3gyMX56b07DWKM8BTtATmHy6Ugjhrf4QdBVpk5ORMwPajZIGksgzTlm1VWYOyWC0txSx+u98NAwIQojF87D5B4kRCGitNxW0je96YHMS++f5Z5PtWbg/m2xamCmOBECjR8IoVWAPbisXC9V7GSU75lfYpqe5Z9T0m6PZ8OBn06e4+RBc5WWamZZ3CFSWlHDZsMucYnHl/htJBSRPn7WyE0h2TCiO65MnfesG61emCd2VaxcvqbCcgCMcX01Kh5tQE5JI0vu9HItfuK8QZbIwKBG+0txh6mAJoEYMz17HJlyFZssCbTDcFUGfRxLAcb4O+QepvLRwj3MViHjzDWKFv9xlA9qkFdKIvkUqJYw7KpdilkkOhzy73AJjc/zdkud5F+yIdBN25OOkd+L1tWZVpuGX3CWwgTvIzH31C5N0DW3VSiUeufdGrG7l8Kwld87CNHgUBjGCXQQl9s+JNIry/UA3p5rrALV/2tNirfUzwOrGts156uELjMw/rQHZKIhgYrTOPKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(376002)(136003)(346002)(39830400003)(66556008)(66946007)(66476007)(83380400001)(1076003)(55016002)(8936002)(86362001)(7416002)(956004)(8676002)(26005)(16526019)(186003)(316002)(478600001)(966005)(2616005)(52116002)(7696005)(36756003)(110136005)(5660300002)(8886007)(6666004)(921005)(2906002)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?jN4kuMSwDXTU9dXMcY1oIeW//9ud7Dj28OMYWkonz8mIPCW6VcdjZiM3yD?=
 =?iso-8859-1?Q?+3BHm2ARPlz38+KS/l27vuUHw2jLRLY+gGr7vDrX3tp/ea+Y1jtxCEax8n?=
 =?iso-8859-1?Q?+O11hTEgLZ4vwOUpnOVy/f230sOu32aA4dyEdardYRFA2P3DHaIavpyiaz?=
 =?iso-8859-1?Q?vePizTA5JYtnPkeRIZDDjrHcTkwo/g26GqedHMpMS3eV9fZZ1xo1dWCfho?=
 =?iso-8859-1?Q?k70WQ2II7xQ69CwY7TToAJ7S9URqmmc3FVHgewRlaqoKhMQaA5ZnXdy1aP?=
 =?iso-8859-1?Q?gZikRCe52Lsqlnhe8Sh8M+vhrMyauSLlMh0A7AsxHcnWdVSceLdkvXbeMt?=
 =?iso-8859-1?Q?ELZZduK7TjlS0g7fcEF4JIo9OABixkY3IE9hoai25CGooNpCHeFqVrjOo2?=
 =?iso-8859-1?Q?y+b7BXKni/3hvJW7j8DybfvY/J0HsiAMW9IcQkkgaWHov8NzSisXNartM4?=
 =?iso-8859-1?Q?AOHpoF/oL6GJEJmG9+dk2d+77jVotUYmlYmyDxE/XX39av1GWrE/fwiemA?=
 =?iso-8859-1?Q?TsHAv6YevCHBfc1BxLgEby2q3cOJP3mI0NhS1zfwwSIaas/U75/Lw9yJqJ?=
 =?iso-8859-1?Q?d4F10xrptmn6YAh0Gb+WVDsPzRGsj5cdttqi2+KRzDF4oDALU/72w+R1e3?=
 =?iso-8859-1?Q?vBfZXi2XGD20rJ2QflbVEQhDAvI9DKeeW+8vVpFVW83IeCLkRilK1sa6M7?=
 =?iso-8859-1?Q?NGDQVPSvSmO8Ot5091hMIt5fk0lXmeHF4L6XeC5M6KlhJtT+9yitCp0x57?=
 =?iso-8859-1?Q?c6rpxZpVoK3QlGFnHJtl2g225Ey+N4qfbFGrWsxpbuOjbDi156Uh7/VbeT?=
 =?iso-8859-1?Q?x6KqRvasi55IoiOc+xUZbpYlMhSp8tq2aRf7jMmrUOFsUeRk0LYOSFsKys?=
 =?iso-8859-1?Q?D9w93t5hUNarINIEjaeHWvgEvuh74u4OJ2diVKCnpGjm9JurcS4zkHxvzp?=
 =?iso-8859-1?Q?bg7r17QkwFxI34r6tEYW+IRpEqMQ954hytj5wQlyQf8Tc2h7BTtlKCPUoB?=
 =?iso-8859-1?Q?0ATgJ5Im+rh2hIPP3/S5TDnh0yi7NUJj3+aNM3?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51fecd5-7dbe-4b7f-2b97-08d8bb65f273
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 04:03:00.8402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntCdKzEUtVWB1jzLkv8+Fs69FVLUT/qKTAQyu+JmFZAKO+6rQ9MeOVk+VjSlhx7krhVS0TnQt8FD1npAoRamVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4941
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Alexander,

Thanks again for your work on this.

On Fri, Jan 15, 2021 at 10:42:39AM +0100, Alexander Dahl wrote:
> Hello Jeff,
> 
> On Thu, Jan 14, 2021 at 09:50:50PM -0600, Jeff LaBundy wrote:
> > On Thu, Jan 14, 2021 at 10:03:12AM +0000, Lee Jones wrote:
> > > On Mon, 28 Dec 2020, Alexander Dahl wrote:
> > > 
> > > > The node names for devices using the pwm-leds driver follow a certain
> > > > naming scheme (now).  Parent node name is not enforced, but recommended
> > > > by DT project.
> > > > 
> > > >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > > >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > > > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
> > > >         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> > > > 
> > > > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > > > Acked-by: Jeff LaBundy <jeff@labundy.com>
> > > > Acked-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > > 
> > > > Notes:
> > > >     v8 -> v9:
> > > >       * added forgotten Acked-by (Jeff LaBundy)
> > > >       * rebased on v5.11-rc1
> > > >     
> > > >     v7 -> v8:
> > > >       * rebased on recent pavel/for-next (post v5.10-rc1)
> > > >       * added Acked-by (Rob Herring)
> > > >     
> > > >     v6 -> v7:
> > > >       * added warning message to commit message (Krzysztof Kozlowski)
> > > >     
> > > >     v6:
> > > >       * added this patch to series
> > > > 
> > > >  Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > Failed to apply:
> > > 
> > > Applying: dt-bindings: mfd: Fix schema warnings for pwm-leds
> > > Using index info to reconstruct a base tree...
> > > M	Documentation/devicetree/bindings/mfd/iqs62x.yaml
> > > /home/lee/projects/linux/kernel/.git/worktrees/mfd/rebase-apply/patch:34: indent with spaces.
> > >             led-1 {
> > > /home/lee/projects/linux/kernel/.git/worktrees/mfd/rebase-apply/patch:35: indent with spaces.
> > >                     label = "panel";
> > > warning: 2 lines add whitespace errors.
> > > Falling back to patching base and 3-way merge...
> > > Auto-merging Documentation/devicetree/bindings/mfd/iqs62x.yaml
> > > CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mfd/iqs62x.yaml
> > > Recorded preimage for 'Documentation/devicetree/bindings/mfd/iqs62x.yaml'
> > 
> > It looks like the following patch already beat this to the punch:
> > 
> > 8237e8382498 ("dt-bindings: mfd: Correct the node name of the panel LED")
> 
> Which tree is that commit on? This one?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/

That's correct.

> 
> > That patch does not retain the LED's label or rename the parent node to
> > led-controller, however. The label hardly matters for this example, but
> > perhaps we still want the parent node change to follow leds-pwm.yaml.
> 
> Should I rework the patch then to have that change only?

That seems like a reasonable compromise.

> 
> Greets
> Alex
> 
> -- 
> /"\ ASCII RIBBON | »With the first link, the chain is forged. The first
> \ / CAMPAIGN     | speech censured, the first thought forbidden, the
>  X  AGAINST      | first freedom denied, chains us all irrevocably.«
> / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

Kind regards,
Jeff LaBundy
